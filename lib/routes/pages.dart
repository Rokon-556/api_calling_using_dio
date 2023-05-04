import 'package:dio_calling_mvc/bindings/product_list_binding.dart';
import 'package:dio_calling_mvc/routes/routes.dart';
import 'package:get/get.dart';

import '../view/product_list_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.PRODUCT_LIST_SCREEN,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
  ];
}