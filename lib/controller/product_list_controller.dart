import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../cache_manager.dart';
import '../model/product_list_model.dart';

class ProductListController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxInt page = 1.obs;
  RxList productList = <Product>[].obs;
  RxInt totalProduct = 0.obs;

  @override
  Future<void> onInit() async {
    await getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    final dio = Dio();
    final response = await dio.get("https://api-marketplace.supershop.ai/api/v1/main-product/list?category=2&operation_type=1&per_page=7&page=$page");
    if(response.statusCode ==200){
      var data = response.data['data']['data'];
      totalProduct.value = response.data['data']['total'];
      for(var product in data){
        productList.add(Product.fromJson(product));
      }
      AppCacheManager.renewCacheData("product", data);
      isLoading.value = false;
    }else{
      log("hello");
      var cachedSellCategoryString = AppCacheManager.getCachedData("product");
      log("cached string: $cachedSellCategoryString");
      if (cachedSellCategoryString != null && cachedSellCategoryString != "") {
        ProductListModel cachedSellData = ProductListModel.fromJson(cachedSellCategoryString);

        if (cachedSellData.data != null) {
          productList.value = cachedSellData.data?.data ?? [];
          // log(message)
          // productList.value = cachedSellData.data ?? [];
        }
      }
      // isLoading.value = false;
    }
    // try {
    //   final dio = Dio();
    //   final response = await dio
    //       .get('Api');
    //
    //   var data = response.data['data']['data'];
    //
    //   totalProduct.value = response.data['data']['total'];
    //   AppCacheManager.renewCacheData("product", data);
    //   log('********$totalProduct');
    //
    //   for (var product in data) {
    //     productList.add(Product.fromJson(product));
    //     log('${productList.length}');
    //   }
    //   isLoading.value = false;
    // } catch (e) {
    //   isLoading.value = false;
    // }
  }

  Future<void> getMoreProducts() async {
    page.value++;
    isLoadingMore.value = true;

    try {
      final dio = Dio();
      final response = await dio
          .get('Your Api');

      var data = response.data['data']['data'];

      if (data.isNotEmpty) {
        for (var product in data) {
          productList.add(Product.fromJson(product));
          log('length:${productList.length}');
        }

        isLoadingMore.value = false;
      }
    } catch (e) {
      isLoadingMore.value = false;
    }
  }
}
