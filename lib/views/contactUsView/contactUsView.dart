// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/components/informationalBox.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact Us',
            style: TextStyle(color: AppColor.whiteColor, fontSize: 22)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone,
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
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColor.greyColor,
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'We\'re always here to help you!',
                      style: TextStyle(
                          fontSize: 22, color: AppColor.primaryTextColor),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                const latitude = 33.66905657088763;
                const longitude = 73.07484914232924;

                const url =
                    'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                // Replace with the URL you want to open
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const ContactBox(
                  icon: Icons.map_outlined,
                  title: 'Address',
                  subtitle: 'Huzaifa center I/8 Markaz , Islamabad'),
            ),
            InkWell(
              onTap: () async {
                const url =
                    'mailto:info@sasti.pk?subject=Subject%20of%20the%20email&body=Body%20of%20the%20email'; // Replace with the URL you want to open
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const ContactBox(
                  icon: Icons.mail,
                  title: 'Email Address',
                  subtitle: 'info@sasti.pk'),
            ),
            InkWell(
              onTap: () async {
                const url = 'tel:+923095915113';

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const ContactBox(
                  icon: Icons.phone,
                  title: 'Phone',
                  subtitle: '+92309-5915113'),
            ),
            const InformationalBox()
          ]),
        ),
      ),
    ));
  }
}

class ContactBox extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const ContactBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Constants.getHeight(context) * 0.22,
        width: Constants.getWidth(context) * 0.7,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.greyColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Icon(
                    icon,
                    size: 50,
                  )),
                )),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: Constants.getWidth(context) * 0.6,
                child: Center(
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColor.secondaryTextColor),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
