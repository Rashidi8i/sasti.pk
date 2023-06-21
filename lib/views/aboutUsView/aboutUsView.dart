// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About Us',
            style: TextStyle(color: AppColor.whiteColor, fontSize: 22)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.perm_device_information_outlined,
              size: 22,
            ),
          )
        ],
        backgroundColor: AppColor.primaryColor,
        elevation: 2,
      ),
      body: SizedBox(
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        child: SingleChildScrollView(
          child: Column(children: const []),
        ),
      ),
    ));
  }
}
