import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/product_list_view_model.dart';
import 'widgets/product_list_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListViewModel>(
      builder: (productListViewModel) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'PRODUCT LIST',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: productListViewModel.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey[700],
                  ),
                )
              : 
              // productListViewModel.productList.isEmpty
              //     ? SizedBox(
              //         height: Get.height,
              //         width: Get.width,
              //         child:const Center(
              //           child: Text('No Product Found'),
              //         ),
              //       )
              //     : 
                  GridView.builder(
                    controller: productListViewModel.scrollController,
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.1 / 2.3,
                    ),
                    itemCount:
                        productListViewModel.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(
                          productData: productListViewModel
                              .productList[index]);
                    },
                  ),
        );
      },
    );
  }
}
