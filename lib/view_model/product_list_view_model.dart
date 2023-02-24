import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_response_model.dart';
import '../respository/api_repository.dart';

class ProductListViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var productListResponse = ProductResponseModel().obs;
  var productList = <Product>[].obs;
  ScrollController scrollController = ScrollController();
  var pageNo = 1.obs;

  void _scrollListener() {
    if (scrollController.position.extentAfter == 0) {
      if (pageNo.value != 1) {
        fetchProductListData(pageNo.value);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(_scrollListener);
  }

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
    fetchProductListData(pageNo.value);
  }

  _showProgressBar() {
    isLoading.value = true;
    update();
  }

  _hideProgressBar() {
    isLoading.value = false;
    update();
  }

  Future<void> fetchProductListData(int page) async {
    _showProgressBar();

    try {
      productListResponse.value = await ApiRepository().fetchProductList(page);
      if (productListResponse.value.productList!.isNotEmpty) {
        productListResponse.value.productList!.asMap().forEach((key, postData) {
          Product product = postData;
          productList.value.add(product);
        });
      }
      pageNo.value = pageNo.value + 1;
      _hideProgressBar();
    } catch (e) {
      log(e.toString());
      _hideProgressBar();
    }
    _hideProgressBar();
  }
}
