// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class ThemeButton extends StatefulWidget {
  final String btnText;
  final bool showLeftIcon;
  final String leftIconSVG;
  final bool showRightIcon;
  final String rightIconSVG;
  final bool isDisabled;
  final bool useSmallBtn;
  final bool useFilledBtn;
  final Function isClicked;
  final double widgetWidth;
  final double? customMarginTop;

  ///textAlignment = 0 --> left
  ///textAlignment = 1 --> Center
  ///textAlignment = 2 --> Right
  const ThemeButton(this.btnText, this.isClicked,
      {this.showLeftIcon = false,
      this.leftIconSVG = 'assets/icon/rightArrow.svg',
      this.showRightIcon = false,
      this.rightIconSVG = 'assets/icon/rightArrow.svg',
      this.isDisabled = false,
      this.useSmallBtn = false,
      this.widgetWidth = 0,
      this.useFilledBtn = false,
      Key? key,
      this.customMarginTop})
      : super(key: key);
  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  _ThemeButtonState();
  double? widgetHeight;
  double smallBtHeight = 40.h;
  double largeBtnHeight = 52.h;
  @override
  void initState() {
    super.initState();
  }

  ///Change Small && Large Button Height
  double setWidgetHeight(bool isSmallBtn) {
    if (isSmallBtn) {
      return smallBtHeight;
    }
    return largeBtnHeight;
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) {
      return context.resources.variables.sizedBoxShrink;
    }
    return Container(
      margin: EdgeInsets.only(top: widget.customMarginTop ?? 24.h),
      decoration: BoxDecoration(
          color: widget.useFilledBtn
              ? widget.isDisabled
                  ? context.resources.colors.primary800
                  : context.resources.colors.primary800
              : widget.isDisabled
                  ? Colors.transparent
                  : Colors.transparent,
          border: Border.all(
            width: 2.sp,
            color: widget.useFilledBtn
                ? widget.isDisabled
                    ? Colors.transparent
                    : context.resources.colors.primary800
                : context.resources.colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        width: double.infinity,
        height: setWidgetHeight(widget.useSmallBtn),
        child: TextButton(
          onPressed: () => !widget.isDisabled ? widget.isClicked() : null,
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, // background
              onPrimary: context.resources.colors.primary), // foreground),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // clipBehavior: Clip.antiAlias, // gap between lines
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: widget.useSmallBtn ? 16.w : 20.w,
                  maxWidth: widget.useSmallBtn ? 16.w : 20.w,
                  minHeight: widget.useSmallBtn ? 16.w : 20.w,
                  maxHeight: widget.useSmallBtn ? 16.w : 20.w,
                ),
                child: widget.showLeftIcon
                    ? SvgPicture.asset(
                        height: widget.useSmallBtn ? 16.w : 20.w,
                        width: widget.useSmallBtn ? 16.w : 20.w,
                        widget.leftIconSVG)
                    : context.resources.variables.sizedBoxShrink,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 24.w,
                  ),
                  child: Text(widget.btnText,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: widget.useSmallBtn
                          ? context.resources.styles
                              .buttonText2(context.resources.colors.white)
                          : context.resources.styles
                              .buttonText1(context.resources.colors.white)),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: widget.useSmallBtn ? 16.w : 20.w,
                  maxWidth: widget.useSmallBtn ? 16.w : 20.w,
                  minHeight: widget.useSmallBtn ? 16.w : 20.w,
                  maxHeight: widget.useSmallBtn ? 16.w : 20.w,
                ),
                child: widget.showRightIcon
                    ? SvgPicture.asset(
                        height: widget.useSmallBtn ? 16.w : 20.w,
                        width: widget.useSmallBtn ? 16.w : 20.w,
                        widget.rightIconSVG)
                    : context.resources.variables.sizedBoxShrink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
