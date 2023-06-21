// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/dashboardController/dashboardController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/categoryView/categoryView.dart';
import 'package:sasti_pk/views/dashboard/widgets/categories.dart';
import 'package:sasti_pk/views/dashboard/widgets/subcategoriesList.dart';

class SubCategories extends StatefulWidget {
  final String category;
  const SubCategories({super.key, required this.category});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  late final List<Category> categories = homeCategries;
  final List<Map<String, dynamic>> subcategories = SubCat.subCategories;
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> subcategoriesMap = {};
    for (var category in subcategories) {
      subcategoriesMap[category['name']] =
          List<Map<String, dynamic>>.from(category['subcategories']);
    }

    return Container(
      height: Constants.getHeight(context) * 0.35,
      width: Constants.getWidth(context) * 0.9,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'In ${widget.category}',
                    style: const TextStyle(
                        color: AppColor.primaryTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      dashboardController.showSubcat();
                    },
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: AppColor.primaryColor,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subcategoriesMap[widget.category]!.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 80,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  maxCrossAxisExtent: 77,
                ),
                itemBuilder: ((context, index) {
                  final subcategory = subcategoriesMap[widget.category]![index];
                  return GestureDetector(
                    onTap: () {
                      // dashboardController.showSubcat();
                      dashboardController.showSubcat();
                      Get.to(() => const CategoryView(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 450));
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
                            child: Image.asset(subcategory['pic'],
                                width: 32, height: 32),
                          ),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          child: Text(
                            subcategory['name'],
                            style: const TextStyle(
                                color: AppColor.primaryTextColor,
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
          ],
        ),
      ),
    );
  }
}
