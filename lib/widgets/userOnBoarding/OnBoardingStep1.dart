import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onefish/utils/validators/validators.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/widgets/themeItems/ThemeButton.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class OnBoardingStep1 extends StatefulWidget {
  final Function showStep2;
  final String phoneNo;
  const OnBoardingStep1(this.phoneNo, this.showStep2, {Key? key})
      : super(key: key);

  @override
  State<OnBoardingStep1> createState() => _OnBoardingStep1State();
}

class _OnBoardingStep1State extends State<OnBoardingStep1> {
  bool validPhoneNumber = false;
  String phoneNo = "";
  Size? btnWidth;

  void proceedToStep2(String insertedPhoneNo) {
    FocusScope.of(context).requestFocus(FocusNode());
    widget.showStep2(insertedPhoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.resources.variables.containerFrame(context),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.resources.lang.mobileNumber,
                style: context.resources.styles
                    .label(context.resources.colors.white)),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(color: white, spreadRadius: 3),
                  // ],
                ),
                width: context.resources.variables.containerFrame(context),
                height: 52.h,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                    child: SvgPicture.asset(
                        height: 25.h, 'assets/icon/bd_flag.svg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 5.h, 10.w, 0),
                    child: Text(context.resources.lang.countryCode,
                        style: context.resources.styles.bodyText1()),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                    child: SvgPicture.asset(
                        height: 20.h, 'assets/icon/seperator.svg'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: SizedBox(
                        width: context.resources.variables
                                .containerFrame(context) -
                            120.w,
                        child: TextFormField(
                            initialValue: widget.phoneNo,
                            maxLength:
                                context.resources.variables.phoneMaxLength,
                            style: context.resources.styles.formInputStyle(),
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText:
                                    context.resources.lang.mobileNumberHint,
                                counterText: "",
                                hintStyle: context.resources.styles.bodyText1(
                                    context.resources.colors.neutral300)),
                            autocorrect: false,
                            onEditingComplete: () {
                              context.resources.logger.shout('keyboard down');
                              //On Keyboard Enter Event
                              if (validPhoneNumber) {
                                proceedToStep2(phoneNo);
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }
                            },
                            onChanged: (String value) {
                              //Validate Phone No
                              validPhoneNumber = isPhoneNumberValid(value);
                              context.resources.logger
                                  .info('Is Valid? $validPhoneNumber');
                              phoneNo = value;
                              setState(() {});
                            },
                            keyboardType: TextInputType.number)),
                  ),
                ])),
            ThemeButton(
              context.resources.lang.nextStep,
              () => proceedToStep2(phoneNo),
              isDisabled: !validPhoneNumber,
              useSmallBtn: false,
              useFilledBtn: false,
              showRightIcon: true,
              rightIconSVG: 'assets/icon/rightArrow.svg',
              showLeftIcon: true,
              leftIconSVG: 'assets/icon/refresh.svg',
              customMarginTop: 32.h,
            ),
          ]),
    );
  }
}
