// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/wishlistController/wishListController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/res/dummyData/productList.dart';
import 'package:sasti_pk/views/productDetailView/productDetailView.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final wishListController = Get.put(WishListController());

  final List<Map<String, dynamic>> productData = productList.product_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: const Text('Wishlist',
            style: TextStyle(color: AppColor.whiteColor, fontSize: 22)),
      ),
      body: Container(
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        color: AppColor.greyColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColor.whiteColor,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 3,
                  //       blurRadius: 5,
                  //       offset: const Offset(0, 2),
                  //     ),
                  //   ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      sortbyPrice(() {
                        wishListController.sortbyPrice();
                      }, 'Price'),
                      sortbyRating(() {
                        wishListController.sortbyRating();
                      }, 'Rating'),
                      sortbyDate(() {
                        wishListController.sortbyDate();
                      }, 'Date'),
                      listLayout()
                    ],
                  ),
                ),
              ),
              Obx(() {
                return wishListController.isGridView.value
                    ? gridProductView(context)
                    : listProductView(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listProductView(BuildContext context) {
    return SizedBox(
      height: Constants.getHeight(context),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productData.length,
        itemBuilder: (context, index) {
          final data = productData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.back();
                Get.to(() => ProductDetailView(index: index));
              },
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color.fromARGB(255, 212, 212, 212)
                    //         .withOpacity(0.5),
                    //     spreadRadius: 3,
                    //     blurRadius: 5,
                    //     offset: const Offset(0, 2),
                    //   ),
                    // ],
                    color: AppColor.whiteColor),
                height: 130,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        data['images'][0],
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text(data['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColor.yellowColor,
                              ),
                              Text('${data['ratings'].toString()}/5'),
                            ],
                          ),
                          Text('Rs. ${data['price'].toString()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Color.fromARGB(94, 0, 0, 0)),
                    //   child: const Padding(
                    //     padding: EdgeInsets.all(6.0),
                    //     child: Icon(
                    //       Icons.favorite_border_outlined,
                    //       color: AppColor.whiteColor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InkWell listLayout() {
    return InkWell(
      onTap: () {
        wishListController.changeLayout();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Icon(wishListController.isGridView.value
                ? Icons.view_list_rounded
                : Icons.grid_view_rounded);
          }),
        ),
      ),
    );
  }

  SizedBox gridProductView(BuildContext context) {
    return SizedBox(
      height: Constants.getHeight(context),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productData.length,
        crossAxisCount: 2,
        // mainAxisSpacing: 0.5,
        // crossAxisSpacing: 0.5,
        itemBuilder: (context, index) {
          final data = productData[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.back();
                Get.to(() => ProductDetailView(index: index));
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColor.whiteColor,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: AppColor.greyColor,
                  //     spreadRadius: 3,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 2),
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Image.network(data['images'][0],
                                width: 120, height: 120),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  data['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Rs. ${data['price'].toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text('${data['ratings'].toString()}/5'),
                            ],
                          )
                        ],
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: Color.fromARGB(94, 0, 0, 0)),
                      //     child: const Padding(
                      //       padding: EdgeInsets.all(6.0),
                      //       child: Icon(
                      //         Icons.favorite_border_outlined,
                      //         color: AppColor.whiteColor,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container sortbyPrice(VoidCallback ontap, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
          onTap: ontap,
          child: Obx(() {
            return Row(
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: wishListController.priceUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: wishListController.priceDown.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                )
              ],
            );
          })),
    );
  }

  Container sortbyRating(VoidCallback ontap, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
          onTap: ontap,
          child: Obx(() {
            return Row(
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: wishListController.ratingUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: wishListController.ratingDown.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                )
              ],
            );
          })),
    );
  }

  Container sortbyDate(VoidCallback ontap, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
          onTap: ontap,
          child: Obx(() {
            return Row(
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: wishListController.dateUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: wishListController.dateDown.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                )
              ],
            );
          })),
    );
  }
}
