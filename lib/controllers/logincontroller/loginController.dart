// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/models/loginModel.dart';
import 'package:sasti_pk/repository/login_repository/login_repository.dart';
import 'package:sasti_pk/utils/utils.dart';
import 'package:sasti_pk/views/navbarView/navBarView.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  LoginModel loginData = LoginModel();
  RxBool isPasswordHide = true.obs;
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final usernameFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      'email': usernameController.value.text,
      'password': passwordController.value.text,
      // 'email': 'jainx@mailinator.com',
      // 'password': 'Password'
    };
    Map<String, String> headers = {
      'api-key': 'd6dcc1bf-1189-4713-acc4-bf1da722475d'
    };
    _api.loginApi(data, headers).then((value) {
      loading.value = false;
      if (value['status']) {
        Utils.toastMessage('Login Successfully');
        loginData = LoginModel.fromJson(value);
        Get.to(() => NavBarView(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 450));
      } else {
        Utils.toastMessage(value['message']);
      }
    }).onError((error, stackTrace) {
      loading.value = false;

      Utils.toastMessage(error.toString());
    });
  }
}
