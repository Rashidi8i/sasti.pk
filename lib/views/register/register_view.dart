// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sasti_pk/controllers/registercontroller/registerController.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/components/round_button.dart';
import 'package:sasti_pk/views/login_view/login_view.dart';
import 'package:sasti_pk/res/components/background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerController = Get.put(RegisterController());
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
                    'SignUp',
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
                    'Create your account',
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
                      Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.05),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  controller: registerController
                                      .usernameController.value,
                                  focusNode: registerController
                                      .usernameFocusNode.value,
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
                                child: TextFormField(
                                  controller:
                                      registerController.emailController.value,
                                  focusNode:
                                      registerController.emailFocusNode.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      //Utils.snackBar('Email', 'Enter email');
                                      return 'Enter Email';
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      labelText: "Email",
                                      prefixIcon: Icon(Icons.mail)),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Obx(() => TextFormField(
                                      controller: registerController
                                          .passwordController.value,
                                      focusNode: registerController
                                          .passwordFocusNode.value,
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
                                              registerController
                                                      .isPasswordHide.value =
                                                  !registerController
                                                      .isPasswordHide.value;
                                            },
                                            icon: Icon(registerController
                                                    .isPasswordHide.value
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                          prefixIcon: const Icon(Icons.lock)),
                                      obscureText: registerController
                                          .isPasswordHide.value,
                                    )),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Obx(() => TextFormField(
                                      controller: registerController
                                          .repasswordController.value,
                                      focusNode: registerController
                                          .repasswordFocusNode.value,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          //Utils.snackBar('Email', 'Enter email');
                                          return 'Enter Password';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Confirm Password",
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              registerController
                                                      .isPasswordHide.value =
                                                  !registerController
                                                      .isPasswordHide.value;
                                            },
                                            icon: Icon(registerController
                                                    .isPasswordHide.value
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                          prefixIcon: const Icon(Icons.lock)),
                                      obscureText: registerController
                                          .isPasswordHide.value,
                                    )),
                              ),
                              SizedBox(height: size.height * 0.05),
                            ],
                          )),
                      Container(
                          // alignment: Alignment.centerRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Obx(() => RoundButton(
                                title: 'SIGNUP',
                                loading: registerController.loading.value,
                                onPress: () {
                                  if (_formkey.currentState!.validate()) {
                                    if (kDebugMode) {
                                      print('error');
                                    }
                                  } else {
                                    registerController.testApi();
                                  }
                                },
                                width: double.infinity,
                              ))),
                      Container(
                        // alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: GestureDetector(
                          onTap: () => {
                            Get.to(() => const LoginView(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 450))
                          },
                          child: const Text(
                            "Already have an Account? Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondaryTextColor),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
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
