// ignore_for_file: file_names

import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxBool priceUp = false.obs;
  RxBool priceDown = false.obs;
  RxBool ratingUp = false.obs;
  RxBool ratingDown = false.obs;
  RxBool dateUp = false.obs;
  RxBool dateDown = false.obs;
  RxBool isGridView = true.obs;

  void sortbyPrice() {
    if (priceUp.value) {
      priceUp.value = !priceUp.value;
      priceDown.value = true;
    } else if (priceDown.value) {
      priceDown.value = !priceDown.value;
      priceUp.value = true;
    } else {
      priceUp.value = true;
    }
  }

  void sortbyRating() {
    if (ratingUp.value) {
      ratingUp.value = !ratingUp.value;
      ratingDown.value = true;
    } else if (ratingDown.value) {
      ratingDown.value = !ratingDown.value;
      ratingUp.value = true;
    } else {
      ratingUp.value = true;
    }
  }

  void sortbyDate() {
    if (dateUp.value) {
      dateUp.value = !dateUp.value;
      dateDown.value = true;
    } else if (dateDown.value) {
      dateDown.value = !dateDown.value;
      dateUp.value = true;
    } else {
      dateUp.value = true;
    }
  }

  void changeLayout() {
    isGridView.value = !isGridView.value;
  }
}
