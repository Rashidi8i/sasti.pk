// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/navbarController/navBarController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/views/accountView/accountView.dart';
import 'package:sasti_pk/views/cartView/cartView.dart';
import 'package:sasti_pk/views/dashboard/dashboard.dart';
import 'package:sasti_pk/views/wishlistView/wishlistView.dart';

class NavBarView extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  NavBarView({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: AppColor.primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  // margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home_outlined,
                    size: 25.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: AppColor.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Badge.count(
                    count: 4,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Icon(Icons.shopping_cart_outlined, size: 25.0),
                    )),
                label: 'Cart',
                backgroundColor: AppColor.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Badge.count(
                    count: 4,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Icon(Icons.favorite_border_rounded, size: 25.0),
                    )),
                label: 'Wishlist',
                backgroundColor: AppColor.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  // margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.person_2_outlined,
                    size: 25.0,
                  ),
                ),
                label: 'Profile',
                backgroundColor: AppColor.primaryColor,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final navbarController = Get.put(NavBarController());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, navbarController),
      body: Obx(() => IndexedStack(
            index: navbarController.tabIndex.value,
            children: const [
              Dashboard(),
              CartView(),
              WishlistView(),
              AccountView(),
            ],
          )),
    ));
  }
}
