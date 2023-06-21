// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/dashboardController/dashboardController.dart';
import 'package:sasti_pk/controllers/logincontroller/loginController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/dashboard/widgets/categoryBox.dart';
import 'package:sasti_pk/views/dashboard/widgets/productList.dart';
import 'package:sasti_pk/views/dashboard/widgets/promoContainer.dart';
import 'package:sasti_pk/views/dashboard/widgets/searchbar.dart';
import 'package:sasti_pk/views/dashboard/widgets/subCategory.dart';
import 'package:sasti_pk/views/dashboard/widgets/topsale.dart';
import 'package:sasti_pk/views/dashboard/widgets/trendingProducts.dart';
import 'package:sasti_pk/views/dashboard/widgets/discountedProducts.dart';
import 'package:sasti_pk/views/dashboard/widgets/featuredProducts.dart';
import 'package:sasti_pk/views/dashboard/widgets/promotionalProducts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final dashboardController = Get.put(DashboardController());
  final loginController = Get.put(LoginController());

  // late ScrollController _scrollController;
  // late double _scrollControlleroffset = 0.0;
  // _ScrollListner() {
  //   setState(() {
  //     _scrollControlleroffset = _scrollController.offset;
  //   });
  // }
  @override
  void initState() {
    dashboardController.scrollController.value
        .addListener(dashboardController.scrollListner);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(() => const WishlistView(),
        //         transition: Transition.rightToLeft,
        //         duration: const Duration(milliseconds: 450));
        //   },
        //   child: const Icon(Icons.favorite_border_rounded),
        // ),
        backgroundColor: AppColor.greyColor,
        body: Stack(
          children: [
            const SizedBox(
              height: 30,
            ),
            Obx(() {
              return SingleChildScrollView(
                controller: dashboardController.scrollController.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PromoContainer(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Categories(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Top Sale Products',
                            style: TextStyle(
                                color: AppColor.primaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 55, 0, 255)),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColor.whiteColor,
                        ),
                        child: const TopSale(),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Trending Products',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColor.whiteColor,
                        ),
                        child: const TrendingProducts(),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Promotional Products',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColor.whiteColor,
                        ),
                        child: const PromotionalProducts(),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Discounted Products',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColor.whiteColor,
                        ),
                        child: const DiscountedProducts(),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Featured Products',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColor.whiteColor,
                        ),
                        child: const FeaturedProducts(),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'All Products',
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const Products()
                  ],
                ),
              );
            }),
            Obx(() {
              return PreferredSize(
                  preferredSize: Size(Constants.getWidth(context), 20.0),
                  child: FadeAppBar(
                    profilePic: loginController.loginData.userInfo!.picture!,
                    scrollOffset:
                        dashboardController.scrollControlleroffset.value,
                  ));
            }),
            Obx(() {
              return dashboardController.showSubcategory.value
                  ? Center(
                      child: SubCategories(
                      category: dashboardController.category.value,
                    ))
                  : const Text('');
            }),
          ],
        ),
      ),
    );
  }
}
