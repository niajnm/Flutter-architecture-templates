import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class FieldContainer extends StatelessWidget {
  final String labelText;
  final String iconPath;
  const FieldContainer(this.labelText, this.iconPath, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      height: 52.h,
      width: MediaQuery.of(context).size.width -
          context.resources.variables.sidePaddingAmount * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: context.resources.colors.neutral50),
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Text(labelText,
                style: context.resources.styles
                    .bodyText2(context.resources.colors.neutral300)),
          ),
          Positioned(
              right: 0,
              top: 12.h,
              child: this.iconPath.contains('svg')
                  ? SvgPicture.asset(height: 25.h, this.iconPath)
                  : Image.asset(this.iconPath, height: 25.h))
        ],
      ),
    );
  }
}
