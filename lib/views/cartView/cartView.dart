// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/cartController/cartController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetX<CartController>(
          builder: (cartController) {
            return cartController.showCheckOut.value
                ? bottumBarContainer()
                : const Text('');
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Cart',
              style: TextStyle(color: AppColor.whiteColor, fontSize: 22)),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 22,
              ),
            )
          ],
          backgroundColor: AppColor.primaryColor,
          elevation: 2,
        ),
        body: Container(
          height: Constants.getHeight(context),
          width: Constants.getWidth(context),
          color: AppColor.greyColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Constants.getHeight(context),
                  child: Obx(() {
                    return ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.cartList.value.length,
                      itemBuilder: (context, index) {
                        var data = cartController.cartList.value[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 110,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: AppColor.whiteColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 3,
                              //     blurRadius: 5,
                              //     offset: const Offset(0, 2),
                              //   ),
                              // ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                    shape: const CircleBorder(),
                                    checkColor: Colors.white,
                                    activeColor: AppColor.primaryButtonColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashRadius: 30.0,
                                    overlayColor: MaterialStateProperty.all(
                                        AppColor.primaryButtonColor),
                                    side: const BorderSide(
                                      color: AppColor.redColor,
                                      width: 2.0,
                                    ),
                                    fillColor: MaterialStateProperty.all(
                                        AppColor.primaryButtonColor),
                                    onChanged: (bool? value) {
                                      if (cartController.cartList[index]
                                          ['Selected']) {
                                        cartController.removefromTotal(
                                            data["price"] * data["quantity"],
                                            index);
                                        setState(() {});
                                      } else {
                                        cartController.addtoTotal(
                                            data["price"] * data["quantity"],
                                            index);
                                        setState(() {});
                                      }
                                    },
                                    value: data['Selected']),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(data["images"][0]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data["name"] + index.toString(),
                                        style: const TextStyle(
                                            color: AppColor.primaryTextColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 230,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Rs. ${data["price"]}'.toString(),
                                              style: const TextStyle(
                                                  color: AppColor
                                                      .secondaryTextColor,
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          cartController
                                                              .decreaseQty(
                                                                  index);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .remove_circle_outline_rounded,
                                                        color: AppColor
                                                            .primaryButtonColor,
                                                      )),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(data["quantity"]
                                                      .toString()),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          cartController
                                                              .increaseQty(
                                                                  index);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .add_circle_outline_rounded,
                                                        color: AppColor
                                                            .primaryButtonColor,
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container bottumBarContainer() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: AppColor.greyColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() {
                return Checkbox(
                  shape: const CircleBorder(),
                  checkColor: AppColor.whiteColor,
                  activeColor: AppColor.primaryButtonColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashRadius: 30.0,
                  overlayColor:
                      MaterialStateProperty.all(AppColor.primaryButtonColor),
                  side: const BorderSide(
                    color: AppColor.primaryButtonColor,
                    width: 2.0,
                  ),
                  fillColor:
                      MaterialStateProperty.all(AppColor.primaryButtonColor),
                  onChanged: (bool? value) {
                    setState(() {
                      cartController.checkAllitems(value!);
                    });
                  },
                  value: cartController.selectAllItem.value,
                );
              }),
              const Text(
                'All',
                style:
                    TextStyle(color: AppColor.primaryTextColor, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Total: ',
                style:
                    TextStyle(color: AppColor.primaryTextColor, fontSize: 16),
              ),
              Obx(() {
                return Text(
                  'Rs. ${cartController.totalAmount.value}',
                  style: const TextStyle(
                      color: AppColor.redColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                );
              }),
              const SizedBox(
                width: 10,
              ),
              Obx(() {
                return bottumButtons(() {}, AppColor.primaryButtonColor,
                    cartController.totalSelectedItems.value.toString());
              })
            ],
          ),
        ],
      ),
    );
  }

  InkWell bottumButtons(VoidCallback ontap, Color color, String title) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: color),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Check Out ($title)',
              style: const TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
