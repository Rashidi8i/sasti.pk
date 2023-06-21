import 'package:flutter/material.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  final String profilePic;
  const FadeAppBar(
      {super.key, required this.scrollOffset, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColor.primaryColor
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 3,
        //     blurRadius: 5,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profilePic),
              ),
              SizedBox(
                width: Constants.getWidth(context) * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search in sasti.pk",
                    hintStyle:
                        const TextStyle(color: AppColor.primaryTextColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.greyColor,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: AppColor.whiteColor,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: AppColor.greyColor)),
                  ),
                ),
              ),
              // Badge.count(
              //   count: 4,
              //   child: IconButton(
              //       onPressed: () {
              //         Get.to(() => const CartView(),
              //             transition: Transition.rightToLeft,
              //             duration: const Duration(milliseconds: 450));
              //       },
              //       icon: const Icon(
              //         Icons.shopping_cart_outlined,
              //         size: 33,
              //       )),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
