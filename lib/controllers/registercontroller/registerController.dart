// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isPasswordHide = true.obs;

  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final repasswordController = TextEditingController().obs;

  final usernameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final repasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void testApi() {
    loading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      loading.value = false;
    });
  }
}
