import 'package:get/get.dart';

import '../view_model/product_list_view_model.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel(), fenix: true);
  }
}
