import 'dart:ui';

import 'package:get/get.dart';
import 'package:sasti_pk/controllers/dashboardController/dashboardController.dart';

class AppColor {
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);

  static const Color primaryColor = Color(0xff01B1C9);
  static const Color primaryColor2 = Color.fromARGB(160, 1, 178, 201);

  static const Color secondaryColor = Color.fromARGB(255, 0, 207, 10);
  static const Color secondaryColor2 = Color.fromARGB(160, 0, 207, 10);

  static const Color primaryButtonColor = Color.fromARGB(255, 0, 207, 10);
  static const Color secondaryButtonColor = Color(0xffFC3F5B);

  static const Color redColor = Color.fromARGB(255, 255, 27, 61);

  static const Color primaryTextColor = Color.fromARGB(255, 32, 32, 32);
  static const Color secondaryTextColor = Color.fromARGB(255, 128, 128, 128);

  static const Color dangerColor = Color.fromARGB(255, 255, 0, 0);
  static const Color buttonTextColor = Color.fromARGB(255, 255, 255, 255);

  static const Color greyColor = Color.fromARGB(255, 224, 224, 224);
  static const Color yellowColor = Color.fromARGB(255, 251, 255, 0);
  final dashboardController = Get.put(DashboardController());
}
