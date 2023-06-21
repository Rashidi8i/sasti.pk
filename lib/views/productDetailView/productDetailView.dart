// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/productDetailController/productDetailController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/res/dummyData/productList.dart';
import 'package:sasti_pk/utils/utils.dart';
import 'package:sasti_pk/views/productDetailView/widgets/decription.dart';
import 'package:sasti_pk/views/productDetailView/widgets/reviews.dart';
import 'package:sasti_pk/res/components/fullScreenImage.dart';

class ProductDetailView extends StatefulWidget {
  final int index;
  const ProductDetailView({super.key, required this.index});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final productDetailController = Get.put(ProductDetailController());
  final List<Map<String, dynamic>> productData = productList.product_list;

  @override
  Widget build(BuildContext context) {
    final data = productData[widget.index];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: AppColor.greyColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Badge.count(
                count: 2,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                    )),
              ),
              bottumButtons(() {}, AppColor.primaryButtonColor, 'Buy Now'),
              bottumButtons(() {
                Utils.toastMessage('Added to cart');
              }, AppColor.secondaryButtonColor, 'Add to Cart'),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColor.greyColor,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        width: double.infinity,
                        child: CarouselSlider.builder(
                          itemCount: data["images"].length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: true,
                            pageSnapping: true,
                          ),
                          itemBuilder: (BuildContext context, int imageIndex,
                              int realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => FullScreenImage(
                                    img: data["images"][imageIndex]));
                              },
                              child: Image.network(
                                data["images"][imageIndex],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            );
                          },
                        ),
                      ),
                      prdductDetail(data),
                      tabBarBox(context),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Related Products',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryTextColor)),
                            listLayout()
                          ],
                        ),
                      ),
                      Obx(() {
                        return productDetailController.isGridView.value
                            ? gridProductView(context)
                            : listProductView(context);
                      }),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              topBar()
              // const SearchBar(),
            ],
          ),
        ),
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
              title,
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
                                color: Colors.yellow,
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
        productDetailController.changeLayout();
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.whiteColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColor.greyColor,
          //     spreadRadius: 3,
          //     blurRadius: 5,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Icon(productDetailController.isGridView.value
                ? Icons.grid_view_rounded
                : Icons.view_list_rounded);
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
                            color: AppColor.greyColor,
                          ),
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

  DefaultTabController tabBarBox(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColor.greyColor,
            ),
            height: Constants.getHeight(context) * 0.4,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: AppColor.primaryColor,
                  labelColor: AppColor.primaryTextColor,
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  tabs: [
                    Tab(
                      text: 'Description',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Description(index: widget.index),
                      const Reviews()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        Badge.count(
          count: 4,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_rounded,
                size: 25,
              )),
        ),
      ],
    );
  }

  SizedBox prdductDetail(Map<String, dynamic> data) {
    return SizedBox(
      // height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  data['name'],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AppColor.primaryTextColor),
                ),
                Text(
                  'Rs. ${data['price'].toString()}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryTextColor),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColor.yellowColor,
                    ),
                    Text(
                      '${data['ratings'].toString()}/5',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondaryTextColor),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_rounded)),
          ],
        ),
      ),
    );
  }
}
