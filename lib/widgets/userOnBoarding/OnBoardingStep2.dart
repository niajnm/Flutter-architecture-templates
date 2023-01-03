import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/widgets/themeItems/ThemeButton.dart';
import 'package:pinput/pinput.dart';

class OnBoardingStep2 extends StatefulWidget {
  final Function setVerficationPin;
  const OnBoardingStep2(this.setVerficationPin, {Key? key}) : super(key: key);

  @override
  State<OnBoardingStep2> createState() => _OnBoardingStep2State();
}

class _OnBoardingStep2State extends State<OnBoardingStep2> {
  bool validPhoneNumber = false;
  Size? btnWidth;
  String verificationCode = "";

  PinTheme defaultPinTheme(BuildContext context) => PinTheme(
        margin: EdgeInsets.only(left: 4.w),
        padding: EdgeInsets.only(top: 4.w),
        width: 60.w,
        height: 60.w,
        textStyle: context.resources.styles
            .bodyText1(context.resources.colors.neutral500),
        decoration: BoxDecoration(
          color: context.resources.colors.white,
          border: Border.all(
              width: 2.sp, color: context.resources.colors.primary800),
          borderRadius: BorderRadius.circular(8),
        ),
      );
  PinTheme submittedPinTheme(BuildContext context) => PinTheme(
        margin: EdgeInsets.only(left: 4.w),
        padding: EdgeInsets.only(top: 4.w),
        width: 60.w,
        height: 60.w,
        textStyle: context.resources.styles
            .bodyText1(context.resources.colors.neutral500),
        decoration: BoxDecoration(
          color: context.resources.colors.white,
          border: Border.all(
              width: 2.sp, color: context.resources.colors.primary800),
          borderRadius: BorderRadius.circular(24),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.resources.variables.containerFrame(context),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                textAlign: TextAlign.left,
                context.resources.lang.verificationHelperText,
                style: context.resources.styles
                    .label(context.resources.colors.white)),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(color: white, spreadRadius: 3),
                  // ],
                ),
                width:
                    context.resources.variables.containerFrame(context) + 5.w,
                child: Pinput(
                    pinAnimationType: PinAnimationType.scale,
                    defaultPinTheme: defaultPinTheme(context),
                    submittedPinTheme: submittedPinTheme(context),
                    onChanged: (String pin) {
                      setState(() {
                        verificationCode = pin;
                      });
                    },
                    onCompleted: (String pin) {
                      setState(() {
                        context.resources.logger.info("The pin is: $pin");
                        verificationCode = pin;
                        if (pin.length == 4) {
                          widget.setVerficationPin(verificationCode);
                        }
                      });
                    })),
            ThemeButton(context.resources.lang.loginText,
                () => widget.setVerficationPin(verificationCode),
                isDisabled: false,
                showLeftIcon: false,
                leftIconSVG: 'assets/icon/refresh.svg',
                showRightIcon: true,
                useSmallBtn: false,
                rightIconSVG: 'assets/icon/rightArrow.svg'),

            Padding(padding: EdgeInsets.only(top: 36.h)),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(context.resources.lang.didnotReceiveVerificationText,
                      style: context.resources.styles
                          .label(context.resources.colors.white)),
                  InkWell(
                    onTap: () {
                      context.resources.logger.info("Resend verification code");
                    },
                    child: Text(context.resources.lang.resendVerificationCode,
                        style: context.resources.styles
                            .textLink(context.resources.colors.neutral)),
                  ),
                ],
              ),
            ),
            // Row(children: [
            //   Padding(
            //     padding: EdgeInsets.only(top: 10.h),
            //     child: Text(
            //         context.resources.lang.didnotReceiveVerificationText,
            //         style: context.resources.styles
            //             .label(context.resources.colors.white)),
            //   ),
            //   Expanded(
            //     child: Align(
            //       alignment: Alignment.centerRight,
            //       child: SizedBox(
            //         width: MediaQuery.of(context).size.width / 3 +
            //             context.resources.variables.sidePaddingAmount * 3,
            //         child: ThemeButton(
            //             context.resources.lang.resendVerificationCode,
            //             () => context.resources.logger
            //                 .info("Resend Verficiation Code"),
            //             customMarginTop: 40.h,
            //             isDisabled: false,
            //             showLeftIcon: true,
            //             leftIconSVG: 'assets/icon/refresh.svg',
            //             showRightIcon: false,
            //             useSmallBtn: false),
            //       ),
            //     ),
            //   ),
            // ]),
          ]),
    );
  }
}
