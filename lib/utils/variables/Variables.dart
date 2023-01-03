import 'package:flutter/material.dart';

abstract class Variables {
  Variables();
  bool get isDebug;
  String get appName;
  String get primaryFontFamily;
  String get secondaryFontFamily;
  Size get screenDesignSize;
  //define your text sizes
  double get sidePaddingAmount;
  double get baseFontSize;
  double get displayFontRatio;
  double get heading1FontRatio;
  double get heading2FontRatio;
  double get heading3FontRatio;
  double get heading4FontRatio;
  double get heading5FontRatio;
  double get heading6FontRatio;
  double get bodyFont1;
  double get bodyFont2;
  double get captionFont;
  double get subTitleFont;
  int get phoneMaxLength;
  Duration get animatedTransitionTime;
  Widget get sizedBoxShrink;
  double containerFrame(BuildContext context);
}
