import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTile extends StatefulWidget {
  final String title;
  final String iconPath;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final int moduleId;
  final Function onTap;
  HomeTile(this.title, this.iconPath, this.color, this.backgroundColor,
      this.borderColor, this.moduleId, this.onTap,
      {Key? key})
      : super(key: key);

  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.moduleId),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            width:
                (context.resources.variables.containerFrame(context) - 12.w) /
                    2,
            height: 80.h,
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                border: Border.all(
                  width: 1.5.sp,
                  color: widget.borderColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                SvgPicture.asset(
                    color: widget.color,
                    height: 28.w,
                    width: 28.w,
                    widget.iconPath),
                Padding(padding: EdgeInsets.only(left: 12.w)),
                Expanded(
                  // width: double.infinity,
                  child: Text(widget.title,
                      softWrap: true,
                      style: context.resources.styles
                          .homeTileItemStyle(widget.color)),
                )
              ],
            )),
      ),
    );
  }
}
