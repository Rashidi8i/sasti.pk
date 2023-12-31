// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/logincontroller/loginController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/components/background.dart';
import 'package:sasti_pk/res/components/round_button.dart';
import 'package:sasti_pk/views/register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Welcome Back!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 360.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller:
                                    loginController.usernameController.value,
                                focusNode:
                                    loginController.usernameFocusNode.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    //Utils.snackBar('Email', 'Enter email');
                                    return 'Enter username';
                                  }
                                },
                                decoration: const InputDecoration(
                                    labelText: "Username",
                                    prefixIcon: Icon(Icons.person)),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Obx(() => TextFormField(
                                    controller: loginController
                                        .passwordController.value,
                                    focusNode:
                                        loginController.passwordFocusNode.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        //Utils.snackBar('Email', 'Enter email');
                                        return 'Enter Password';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            loginController
                                                    .isPasswordHide.value =
                                                !loginController
                                                    .isPasswordHide.value;
                                          },
                                          icon: Icon(loginController
                                                  .isPasswordHide.value
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                        prefixIcon: const Icon(Icons.lock)),
                                    obscureText:
                                        loginController.isPasswordHide.value,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.dangerColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                          // alignment: Alignment.centerRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Obx(() => RoundButton(
                                loading: loginController.loading.value,
                                title: 'LOGIN',
                                onPress: () {
                                  if (_formkey.currentState!.validate()) {
                                    loginController.loginApi();

                                    if (kDebugMode) {
                                      print('_form key ok');
                                    }
                                  } else {
                                    loginController.loginApi();

                                    // Get.to(() => const Dashboard());
                                  }
                                },
                                width: double.infinity,
                              ))),
                      Container(
                        // alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: GestureDetector(
                          onTap: () => {
                            Get.to(() => const RegisterScreen(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 450))
                          },
                          child: const Text(
                            "Don't Have an Account? Sign up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondaryTextColor),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
