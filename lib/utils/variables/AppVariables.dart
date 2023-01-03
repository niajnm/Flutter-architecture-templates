import 'package:onefish/utils/variables/Variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class AppVariables implements Variables {
  AppVariables();
  @override
  bool isDebug = true;

  @override
  String get appName => "Onefish";

  @override
  String get primaryFontFamily => 'Noto Sans Bengali';

  @override
  String get secondaryFontFamily => 'Inter';

  @override
  Size get screenDesignSize => const Size(360, 800);

  @override
  double get sidePaddingAmount => 20;

  @override
  double get baseFontSize => 20.0.sp;

  @override
  double get displayFontRatio => 2;

  @override
  double get heading1FontRatio => 1.99;

  @override
  double get heading2FontRatio => 1.659;

  @override
  double get heading3FontRatio => 1.383;

  @override
  double get heading4FontRatio => 1.152;

  @override
  double get heading5FontRatio => 0.96;

  @override
  double get heading6FontRatio => 0.8;

  @override
  double get bodyFont1 => baseFontSize;

  @override
  double get bodyFont2 => 0.9 * baseFontSize;

  @override
  double get captionFont => 0.555 * baseFontSize;

  @override
  double get subTitleFont => 0.386 * baseFontSize;

  @override
  int get phoneMaxLength => 11;

  @override
  Duration animatedTransitionTime = const Duration(milliseconds: 500);

  @override
  Widget sizedBoxShrink = const SizedBox.shrink();

  @override
  double containerFrame(BuildContext context) =>
      MediaQuery.of(context).size.width -
      context.resources.variables.sidePaddingAmount * 2;
}
