// ignore_for_file: non_constant_identifier_names, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoContainer extends StatefulWidget {
  const PromoContainer({super.key});

  @override
  State<PromoContainer> createState() => _PromoContainerState();
}

class _PromoContainerState extends State<PromoContainer> {
  final List<String> imgs = [
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b530f7110494491.5feef8228f2b8.png',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/91503d110494491.5feef8228f77b.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8xxPUTqdiR4tKFNUI7WAzrkubVIMqWocBon_ckIaAXOF719o_5jdm-cGn9kl7e-aItKI&usqp=CAU',
    'https://t3.ftcdn.net/jpg/04/12/33/92/360_F_412339280_8yXMCSiReo2YZEuwkuhglQBYahvpGiJE.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          autoPlay: true, autoPlayInterval: const Duration(seconds: 5)),
      itemCount: imgs.length,
      itemBuilder: (context, itemIndex, realIndex) {
        return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.network(
                imgs[itemIndex],
                fit: BoxFit.fill,
              ),
            ));
      },
    );
  }
}
