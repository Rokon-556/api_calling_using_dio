import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    try {
      final dio = Dio();
      final response = await dio
          .get('Api');

      var data = response.data['data']['data'];

      totalProduct.value = response.data['data']['total'];
      log('********$totalProduct');

      for (var product in data) {
        productList.add(Product.fromJson(product));
        log('${productList.length}');
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
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
