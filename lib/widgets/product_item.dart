import 'package:flutter/material.dart';

import '../model/product_list_model.dart';
import 'common_network_image_widget.dart';

class ProductItem extends StatelessWidget {
  Product productData;

  ProductItem({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.only(left: 0.0, right: 0, top: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: CommonNetworkImageWidget(imageLink: productData.image!,),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0),
                child: Text(productData.name!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}