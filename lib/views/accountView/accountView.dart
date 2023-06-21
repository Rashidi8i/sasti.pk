// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:sasti_pk/views/accountView/widgets/profile_pic.dart';
import 'package:sasti_pk/views/login_view/login_view.dart';
import 'package:sasti_pk/views/contactUsView/contactUsView.dart';
import 'package:sasti_pk/views/aboutUsView/aboutUsView.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Profile',
            style: TextStyle(color: AppColor.whiteColor, fontSize: 22)),
        backgroundColor: AppColor.primaryColor,
        elevation: 2,
      ),
      body: SizedBox(
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: ProfilePic(),
              ),
              Column(
                children: [
                  AccountTiles(context, Icons.phone, 'Contact Us', () {
                    Get.to(() => const ContactUs(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 450));
                  }),
                  AccountTiles(context, Icons.perm_device_information_rounded,
                      'About Us', () {
                    Get.to(() => const AboutUs(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 450));
                  }),
                  AccountTiles(
                      context, Icons.shopping_bag_sharp, 'Order Status', () {}),
                  AccountTiles(context, Icons.logout_rounded, 'Logout', () {
                    Get.to(() => const LoginView(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 450));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding AccountTiles(
      BuildContext context, IconData icon, String title, VoidCallback ontap) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => ontap(),
        child: Container(
          height: 60,
          width: Constants.getWidth(context),
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
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 25,
                  color: AppColor.secondaryTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: Constants.getWidth(context) * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, color: AppColor.primaryTextColor),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 22,
                        color: AppColor.secondaryTextColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
