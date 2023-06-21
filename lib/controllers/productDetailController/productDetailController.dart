// ignore_for_file: file_names

import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  RxBool isGridView = true.obs;

  void changeLayout() {
    isGridView.value = !isGridView.value;
  }
}
