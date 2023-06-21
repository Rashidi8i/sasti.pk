import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/navbarView/navBarView.dart';
import 'package:sasti_pk/views/wishlistView/wishlistView.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => NavBarView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 450));
                  },
                  child: const Icon(Icons.arrow_back_ios_sharp)),
              SizedBox(
                width: Constants.getWidth(context) * 0.75,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search in sasti.pk",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 148, 148, 148)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 148, 148, 148),
                      size: 20,
                    ),
                    filled: true,
                    fillColor: AppColor.whiteColor,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 194, 194, 194))),
                  ),
                ),
              ),
              Badge.count(
                count: 4,
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const WishlistView(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 450));
                    },
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      size: 25,
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
