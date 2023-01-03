// import 'package:onefish/utils/colors/AppColors.dart';
// import 'package:onefish/utils/Reso.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class CustomStyles {
  final BuildContext _context;
  const CustomStyles(this._context, {Key? key});

  ThemeData appTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: _context.resources.colors.primary,
        primarySwatch: _context.resources.colors.colorPrimary,
        fontFamily: _context.resources.variables.primaryFontFamily,
        scaffoldBackgroundColor: _context.resources.colors.bodyBG,
        textTheme: TextTheme(
          headline1: headline1(),
          headline2: headline2(),
          headline3: headline3(),
          headline4: headline4(),
          headline5: headline5(),
          headline6: headline6(),
          bodyText1: bodyText1(),
          bodyText2: bodyText2(),
          caption: caption(),
          subtitle1: subtitle1(),
          subtitle2: subtitle2(),
        ),
      );

  EdgeInsets sidesPadding() => EdgeInsets.fromLTRB(
      _context.resources.variables.sidePaddingAmount,
      0,
      _context.resources.variables.sidePaddingAmount,
      0);

// /// Theme Styles
  TextStyle headline1([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.heading1FontRatio *
          _context.resources.variables.baseFontSize,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 2.64,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle headline2([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: (_context.resources.variables.heading2FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 2.20,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle headline3([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: (_context.resources.variables.heading3FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.83,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle headline4([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: (_context.resources.variables.heading4FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.15,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle headline5([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: (_context.resources.variables.heading5FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.27,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle headline6([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: (_context.resources.variables.heading6FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.06,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle bodyText1([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont1,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 1.17,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle bodyText2([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont2,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 1.17,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle caption([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.captionFont,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 0.67,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle subtitle1([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.subTitleFont,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 0.67,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle subtitle2([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.subTitleFont,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 0.67,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle formInputStyle([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont1,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w500,
      height: 1.6,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle buttonText1([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont1,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.4.sp,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle buttonText2([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont2,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.4.sp,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle label([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont1 * 0.8,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w400,
      height: 1.4.sp,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle textLink([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: _context.resources.variables.bodyFont1 * 0.8,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.4.sp,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle calendarBody([Color? fontColor, String? fontFamily]) => TextStyle(
      fontSize: 13.sp,
      fontFamily: fontFamily ?? _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w400,
      height: 2.2.sp,
      color: fontColor ?? _context.resources.colors.neutral);

  TextStyle bottomNavTextStyle([Color? fontColor]) => TextStyle(
      fontSize: 15.sp,
      fontFamily: _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w400,
      height: 1.2.sp,
      color: fontColor ?? _context.resources.colors.neutral400);


  TextStyle homeTileGroupHeaderStyle([Color? fontColor]) => TextStyle(
      fontSize: (_context.resources.variables.heading3FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: fontColor ?? _context.resources.colors.primary700);

  TextStyle homeTileItemStyle([Color? fontColor]) => TextStyle(
      fontSize: (_context.resources.variables.heading4FontRatio *
          _context.resources.variables.baseFontSize),
      fontFamily: _context.resources.variables.primaryFontFamily,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: fontColor ?? _context.resources.colors.primary700);
}
