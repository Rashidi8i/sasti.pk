// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxBool showSubcategory = false.obs;
  RxString category = 'Fashion'.obs;
  RxDouble scrollControlleroffset = 0.0.obs;
  scrollListner() {
    scrollControlleroffset.value = scrollController.value.offset;
  }

  void showSubcat() {
    showSubcategory.value = !showSubcategory.value;
  }
}
