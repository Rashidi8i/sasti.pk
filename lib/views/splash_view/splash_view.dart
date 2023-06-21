import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/views/login_view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Get.to(() => const LoginView(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 450)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Sasti.pk',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryTextColor),
            ),
            Text(
              'that you can afford!',
              style:
                  TextStyle(fontSize: 20, color: AppColor.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
