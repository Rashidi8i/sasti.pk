// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sasti_pk/res/colors/app_color.dart';
import 'package:sasti_pk/res/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationalBox extends StatefulWidget {
  const InformationalBox({super.key});

  @override
  State<InformationalBox> createState() => _InformationalBoxState();
}

class _InformationalBoxState extends State<InformationalBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Constants.getHeight(context) * 0.9,
      width: Constants.getWidth(context),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromARGB(159, 128, 240, 255),
      ),
      child: Column(
        children: const [
          Services(
              img: 'assets/images/delivery.png',
              title: 'Free Delivery',
              subtitle:
                  'Phasellus blandit massa enim elit of passage varius nunc.'),
          Divider(
            indent: 20.0,
            endIndent: 20.0,
            color: AppColor.whiteColor,
            thickness: 1,
          ),
          Services(
              img: 'assets/images/return.png',
              title: '7 Days Return Guarantee',
              subtitle:
                  'Phasellus blandit massa enim elit of passage varius nunc.'),
          Divider(
            indent: 20.0,
            endIndent: 20.0,
            color: AppColor.whiteColor,
            thickness: 1,
          ),
          Services(
              img: 'assets/images/support.png',
              title: '27/4 Online Support',
              subtitle:
                  'Phasellus blandit massa enim elit of passage varius nunc.'),
          Divider(
            indent: 20.0,
            endIndent: 20.0,
            color: AppColor.whiteColor,
            thickness: 1,
          ),
          Text(
            '© 2022 Sasti.pk',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: AppColor.secondaryTextColor),
          ),
          SizedBox(
            height: 10,
          ),
          SocialBox(),
          SizedBox(
            height: 10,
          ),
          PaymentBox(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class PaymentBox extends StatelessWidget {
  const PaymentBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColor.whiteColor,
      ),
      width: Constants.getWidth(context) * 0.95,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          'assets/images/visa.png',
          height: 40,
        ),
        Image.asset(
          'assets/images/master.png',
          height: 40,
        ),
        Image.asset(
          'assets/images/disc.png',
          height: 40,
        ),
        Image.asset(
          'assets/images/Aexp.png',
          height: 40,
        ),
        Image.asset(
          'assets/images/pp.png',
          height: 40,
        ),
      ]),
    );
  }
}

class SocialBox extends StatelessWidget {
  const SocialBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColor.whiteColor,
      ),
      width: Constants.getWidth(context) * 0.95,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () async {
                const url =
                    'https://www.facebook.com/sasti.pk'; // Replace with the URL you want to open
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/images/fb.png',
                height: 40,
              ),
            ),
            InkWell(
              onTap: () async {
                const url =
                    'https://www.youtube.com/@sastipk'; // Replace with the URL you want to open
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/images/yt.png',
                height: 40,
              ),
            ),
            InkWell(
              onTap: () async {
                const url =
                    'https://www.instagram.com/sasti.pkofficial/'; // Replace with the URL you want to open
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/images/insta.png',
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  final String img, title, subtitle;
  const Services({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Constants.getWidth(context) * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            img,
            height: 75,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: Constants.getWidth(context) * 0.6,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColor.secondaryTextColor),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
