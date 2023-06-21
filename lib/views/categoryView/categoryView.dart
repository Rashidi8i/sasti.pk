// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/categoryController/categoryController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/dummyData/productList.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/categoryView/widgets/searchbar.dart';
import 'package:sasti_pk/views/productDetailView/productDetailView.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final categoryController = Get.put(CategoryController());
  final List<Map<String, dynamic>> productData = productList.product_list;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Constants.getHeight(context),
              width: Constants.getWidth(context),
              color: AppColor.greyColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            sortbyPrice(() {
                              categoryController.sortbyPrice();
                            }, 'Price'),
                            sortbyRating(() {
                              categoryController.sortbyRating();
                            }, 'Rating'),
                            sortbyDate(() {
                              categoryController.sortbyDate();
                            }, 'Date'),
                            listLayout()
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      return categoryController.isGridView.value
                          ? gridProductView(context)
                          : listProductView(context);
                    }),
                    // gridProductView(context),
                    // listProductView(context),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SearchBar()
          ],
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
                Get.to(() => ProductDetailView(index: index),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 450));
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
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.greyColor),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
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
        categoryController.changeLayout();
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
            return Icon(categoryController.isGridView.value
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
                Get.to(() => ProductDetailView(index: index),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 450));
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
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
                                color: AppColor.yellowColor,
                              ),
                              Text('${data['ratings'].toString()}/5'),
                            ],
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.greyColor),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      )
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
                  color: categoryController.priceUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: categoryController.priceDown.value
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
                  color: categoryController.ratingUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: categoryController.ratingDown.value
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
                  color: categoryController.dateUp.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                ),
                Text(title),
                Icon(
                  Icons.arrow_downward,
                  color: categoryController.dateDown.value
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.black,
                )
              ],
            );
          })),
    );
  }
}
