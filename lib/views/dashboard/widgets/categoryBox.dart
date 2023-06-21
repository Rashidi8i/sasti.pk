// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/dashboardController/dashboardController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/views/dashboard/widgets/categories.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late final List<Category> categories = homeCategries;
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 80,
            mainAxisSpacing: 20,
            crossAxisSpacing: 24,
            maxCrossAxisExtent: 77,
          ),
          itemBuilder: ((context, index) {
            final data = categories[index];
            return GestureDetector(
              onTap: () {
                dashboardController.showSubcat();
                dashboardController.category.value = 'Men\'s Fashion';
                // Get.to(() => const CategoryView(),
                //     transition: Transition.rightToLeft,
                //     duration: const Duration(milliseconds: 450));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(data.icon, width: 32, height: 32),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    child: Text(
                      data.title,
                      style: const TextStyle(
                          color: AppColor.secondaryTextColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
