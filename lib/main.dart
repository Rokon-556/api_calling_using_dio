import 'package:dio_calling_mvc/bindings/product_list_binding.dart';
import 'package:dio_calling_mvc/routes/pages.dart';
import 'package:dio_calling_mvc/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main Product',
      initialRoute: AppRoutes.PRODUCT_LIST_SCREEN,
      initialBinding: ProductListBinding(),
      getPages: AppPages.list,
    );
  }
}


