import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneFishTopLogo extends StatelessWidget {
  final String imageAsset;
  const OneFishTopLogo(
      {this.imageAsset: 'assets/images/logos/full_white_logo.png', Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100.h,
      child: Center(
        child: Image.asset(imageAsset,
            width: MediaQuery.of(context).size.width * 0.4),
      ),
    );
  }
}
