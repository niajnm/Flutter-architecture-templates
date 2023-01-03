import 'package:flutter/material.dart';
import 'package:onefish/utils/colors/BaseColors.dart';

class AppColors implements BaseColors {
  const AppColors();
  @override
  Color get white => const Color(0xffffffff);
  @override
  Color get bodyBG => const Color(0xffffffff);

  //Primary Shades
  @override
  Color get primary => const Color(0xff194185);
  @override
  Color get primary25 => const Color(0xffF5FAFF);
  @override
  Color get primary50 => const Color(0xffEFF8FF);
  @override
  Color get primary100 => const Color(0xffD1E9FF);
  @override
  Color get primary200 => const Color(0xffB2DDFF);
  @override
  Color get primary300 => const Color(0xff53B1FD);
  @override
  Color get primary400 => const Color(0xff53B1FD);
  @override
  Color get primary500 => const Color(0xff2E90FA);
  @override
  Color get primary600 => const Color(0xff1570EF);
  @override
  Color get primary700 => const Color(0xff175CD3);
  @override
  Color get primary800 => const Color(0xff1849A9);
  @override
  Color get primary900 => const Color(0xff194185);

  //Secondary Shades
  @override
  Color get secondary => const Color(0xff3E1C96);
  @override
  Color get secondary25 => const Color(0xffFAFAFF);
  @override
  Color get secondary50 => const Color(0xffF4F3FF);
  @override
  Color get secondary100 => const Color(0xffEBE9FE);
  @override
  Color get secondary200 => const Color(0xffD9D6FE);
  @override
  Color get secondary300 => const Color(0xffBDB4FE);
  @override
  Color get secondary400 => const Color(0xff9B8AFB);
  @override
  Color get secondary500 => const Color(0xff7A5AF8);
  @override
  Color get secondary600 => const Color(0xff6938EF);
  @override
  Color get secondary700 => const Color(0xff5925DC);
  @override
  Color get secondary800 => const Color(0xff4A1FB8);
  @override
  Color get secondary900 => const Color(0xff3E1C96);

  //Tertiary Shades
  @override
  Color get tertiary => const Color(0xff851651);
  @override
  Color get tertiary25 => const Color(0xffFEF6FB);
  @override
  Color get tertiary50 => const Color(0xffFDF2FA);
  @override
  Color get tertiary100 => const Color(0xffFCE7F6);
  @override
  Color get tertiary200 => const Color(0xffFCCEEE);
  @override
  Color get tertiary300 => const Color(0xffFAA7E0);
  @override
  Color get tertiary400 => const Color(0xffF670C7);
  @override
  Color get tertiary500 => const Color(0xffEE46BC);
  @override
  Color get tertiary600 => const Color(0xffDD2590);
  @override
  Color get tertiary700 => const Color(0xffC11574);
  @override
  Color get tertiary800 => const Color(0xff9E165F);
  @override
  Color get tertiary900 => const Color(0xff851651);

  //Neutral Shades
  @override
  Color get neutral => const Color(0xff101828);
  @override
  Color get neutral25 => const Color(0xffFCFCFD);
  @override
  Color get neutral50 => const Color(0xffF9FAFB);
  @override
  Color get neutral100 => const Color(0xffF2F4F7);
  @override
  Color get neutral200 => const Color(0xffEAECF0);
  @override
  Color get neutral300 => const Color(0xffD0D5DD);
  @override
  Color get neutral400 => const Color(0xff98A2B3);
  @override
  Color get neutral500 => const Color(0xff667085);
  @override
  Color get neutral600 => const Color(0xff475467);
  @override
  Color get neutral700 => const Color(0xff344054);
  @override
  Color get neutral800 => const Color(0xff1D2939);
  @override
  Color get neutral900 => const Color(0xff101828);

  //Success Shades
  @override
  Color get success => const Color(0xff054F31);
  @override
  Color get success25 => const Color(0xffF6FEF9);
  @override
  Color get success50 => const Color(0xffECFDF3);
  @override
  Color get success100 => const Color(0xffD1FADF);
  @override
  Color get success200 => const Color(0xffA6F4C5);
  @override
  Color get success300 => const Color(0xff6CE9A6);
  @override
  Color get success400 => const Color(0xff32D583);
  @override
  Color get success500 => const Color(0xff12B76A);
  @override
  Color get success600 => const Color(0xff039855);
  @override
  Color get success700 => const Color(0xff027A48);
  @override
  Color get success800 => const Color(0xff05603A);
  @override
  Color get success900 => const Color(0xff054F31);

  //Warning Shades
  @override
  Color get warning => const Color(0xff7A2E0E);
  @override
  Color get warning25 => const Color(0xffFFFCF5);
  @override
  Color get warning50 => const Color(0xffFFFAEB);
  @override
  Color get warning100 => const Color(0xffFEF0C7);
  @override
  Color get warning200 => const Color(0xffFEDF89);
  @override
  Color get warning300 => const Color(0xffFEC84B);
  @override
  Color get warning400 => const Color(0xffFDB022);
  @override
  Color get warning500 => const Color(0xffF79009);
  @override
  Color get warning600 => const Color(0xffDC6803);
  @override
  Color get warning700 => const Color(0xffB54708);
  @override
  Color get warning800 => const Color(0xff93370D);
  @override
  Color get warning900 => const Color(0xff7A2E0E);

  //Error Shades
  @override
  Color get error => const Color(0xff7A271A);
  @override
  Color get error25 => const Color(0xffFFFBFA);
  @override
  Color get error50 => const Color(0xffFEF3F2);
  @override
  Color get error100 => const Color(0xffFEE4E2);
  @override
  Color get error200 => const Color(0xffFECDCA);
  @override
  Color get error300 => const Color(0xffFDA29B);
  @override
  Color get error400 => const Color(0xffF97066);
  @override
  Color get error500 => const Color(0xffF04438);
  @override
  Color get error600 => const Color(0xffD92D20);
  @override
  Color get error700 => const Color(0xffB42318);
  @override
  Color get error800 => const Color(0xff912018);
  @override
  Color get error900 => const Color(0xff7A271A);

  ///Theme color swatches
  final Map<int, Color> _primary = const {
    0: Color(0xffF5FAFF),
    50: Color(0xffEFF8FF),
    100: Color(0xffD1E9FF),
    200: Color(0xffB2DDFF),
    300: Color(0xff53B1FD),
    400: Color(0xff53B1FD),
    500: Color(0xff2E90FA),
    600: Color(0xff1570EF),
    700: Color(0xff175CD3),
    800: Color(0xff1849A9),
    900: Color(0xff194185)
  };
  @override
  MaterialColor get colorPrimary => MaterialColor(0xff2E90FA, _primary);
}
