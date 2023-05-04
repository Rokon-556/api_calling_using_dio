import 'package:dio_calling_mvc/controller/product_list_controller.dart';
import 'package:dio_calling_mvc/widgets/animated_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_item.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'PRODUCT LIST',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const AnimatedLoader()
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController
                        ..addListener(() async {
                          bool isInBottom = scrollController.position.pixels == scrollController.position.maxScrollExtent;
                          bool canLoadMore = controller.productList.length != controller.totalProduct.value;
                          if (isInBottom && canLoadMore && !controller.isLoadingMore.value) {
                            await controller.getMoreProducts();
                          }
                        }),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 2.1 / 2.3,
                      ),
                      itemCount: controller.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(productData: controller.productList[index]);
                      },
                    ),
                  ),
                  Obx(
                    () => controller.isLoadingMore.value
                        ? const SizedBox(height: 50, width: 50, child: AnimatedLoader())
                        : const SizedBox(),
                  ),
                ],
              ),
      ),
    );
  }
}
