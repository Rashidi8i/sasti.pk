import 'package:flutter/material.dart';
import 'package:sasti_pk/res/colors/app_color.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.primaryColor,
            backgroundImage: AssetImage('assets/images/dp.png'),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: AppColor.whiteColor),
                  ),
                  backgroundColor: AppColor.primaryColor,
                ),
                onPressed: () {},
                child: const Icon(Icons.camera_alt_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }
}
