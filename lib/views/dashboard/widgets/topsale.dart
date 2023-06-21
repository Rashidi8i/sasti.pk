import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/dummyData/productList.dart';
import 'package:sasti_pk/views/productDetailView/productDetailView.dart';

class TopSale extends StatefulWidget {
  const TopSale({super.key});

  @override
  State<TopSale> createState() => _TopSaleState();
}

class _TopSaleState extends State<TopSale> {
  final List<Map<String, dynamic>> productData = productList.product_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            final data = productData[index];
            return InkWell(
              onTap: () {
                Get.to(() => ProductDetailView(index: index),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 450));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Stack(
                  children: [
                    Container(
                      height: 220,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.greyColor,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(data['images'][0],
                                width: 150, height: 150),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rs. ${data['price'].toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Rs.5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2.0,
                                    decorationColor:
                                        AppColor.secondaryTextColor,
                                    color: AppColor.secondaryTextColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 30,
                        color: AppColor.redColor,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              'Top Sale',
                              style: TextStyle(color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
