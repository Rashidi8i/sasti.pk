// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/dashboard/widgets/categories.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  late final List<Category> categories = homeCategries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.getHeight(context),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        crossAxisCount: 2,
        // mainAxisSpacing: 0.5,
        // crossAxisSpacing: 0.5,
        itemBuilder: (context, index) {
          final data = categories[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                          child:
                              Image.asset(data.icon, width: 100, height: 100),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              data.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Rs. 150',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text('4.5/5'),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(94, 0, 0, 0)),
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
          );
        },
      ),
    );
  }
}
