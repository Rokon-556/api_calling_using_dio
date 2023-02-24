import 'package:get/get.dart';

import '../view/product_list_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.PRODUCT_LIST_SCREEN,
      page: () => const ProductListScreen(),
    ),
  ];
}
