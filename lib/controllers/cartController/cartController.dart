// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:sasti_pk/res/dummyData/cartList.dart';

class CartController extends GetxController {
  RxBool selectAllItem = false.obs;
  RxBool showCheckOut = false.obs;
  RxInt totalAmount = 0.obs;
  RxInt totalSelectedItems = 0.obs;
  RxList<Map<String, dynamic>> cartList = CartList.cart_list.obs;

  void checkAllitems(bool value) {
    selectAllItem.value = !selectAllItem.value;
    if (value) {
      totalSelectedItems.value = cartList.value.length;
    } else {
      totalSelectedItems.value = 0;
      totalAmount.value = 0;
    }
    for (int i = 0; i < cartList.value.length; i++) {
      cartList[i]["Selected"] = value;
      if (value) {
        totalAmount.value = cartList[i]["price"] + totalAmount.value;
      }
    }
  }

  void addtoTotal(int price, int index) {
    cartList[index]["Selected"] = !cartList[index]["Selected"];

    totalSelectedItems.value++;
    totalAmount.value = totalAmount.value + price;
    if (totalSelectedItems.value > 0) {
      showCheckOut.value = true;
    } else {
      showCheckOut.value = false;
    }
  }

  void removefromTotal(int price, int index) {
    cartList[index]["Selected"] = !cartList[index]["Selected"];

    totalSelectedItems.value--;
    totalAmount.value = totalAmount.value - price;
    if (totalSelectedItems.value > 0) {
      showCheckOut.value = true;
    } else {
      showCheckOut.value = false;
    }
  }

  void increaseQty(int index) {
    cartList.value[index]["quantity"] = cartList.value[index]["quantity"] + 1;
  }

  void decreaseQty(int index) {
    cartList.value[index]["quantity"] = cartList.value[index]["quantity"] - 1;
  }
}
