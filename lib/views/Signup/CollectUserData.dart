import 'package:flutter/material.dart';
import 'package:onefish/models/Auth/RegistrationModel.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/view_model/OnBoardingViewModel.dart';
import 'package:onefish/widgets/themeItems/BackBtnManual.dart';
import 'package:onefish/widgets/themeItems/OneFishTopLogo.dart';
import 'package:onefish/widgets/themeItems/SectionTile.dart';
import 'package:onefish/widgets/userOnBoarding/OnBoardingStep4.dart';
import 'package:onefish/widgets/userOnBoarding/OnBoardingStep3.dart';
import 'package:provider/provider.dart';

class CollectUserData extends StatefulWidget {
  const CollectUserData({Key? key}) : super(key: key);

  @override
  _CollectUserDataState createState() => _CollectUserDataState();
}

class _CollectUserDataState extends State<CollectUserData> {
  ScrollController _scrollController = ScrollController();
  List<Map> selectionOptions = [
    {'id': 1, 'title': 'মাছ চাষি'},
    {'id': 2, 'title': 'ইনপুট ডিলার'},
    {'id': 3, 'title': 'মাছ ব্যবসায়ী'},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void selectedStep1Item(int value) {
    context.resources.logger.info('Radio button Results $value');
    Provider.of<OnBoardingViewModel>(context, listen: false).setUserType(value);
    Provider.of<OnBoardingViewModel>(context, listen: false)
        .setShowWhichStep(4);
  }

  void submitRegistrationForm(BuildContext context, RegistrationModel data) {
    context.resources.logger.info('Registration Data $data');
    Provider.of<OnBoardingViewModel>(context, listen: false)
        .registerAndLogInUser(context, data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(
          context.resources.variables.sidePaddingAmount,
          32.h,
          context.resources.variables.sidePaddingAmount,
          8.h),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Stack(
                children: [
                  OneFishTopLogo(
                      imageAsset: 'assets/images/logos/full_color_logo.png'),
                  Provider.of<OnBoardingViewModel>(context).getShowWhichStep !=
                          3
                      ? Positioned(
                          top: 36.w,
                          child: BackBtnManual(
                              () => Provider.of<OnBoardingViewModel>(context,
                                      listen: false)
                                  .setShowWhichStep(3),
                              context.resources.colors.primary800))
                      : context.resources.variables.sizedBoxShrink,
                ],
              ),
              SectionTitle(
                  Provider.of<OnBoardingViewModel>(context).getShowWhichStep ==
                          3
                      ? context.resources.lang.userInformation
                      : context.resources.lang.userData),
              Provider.of<OnBoardingViewModel>(context).getShowWhichStep == 3
                  ? OnBoardingStep3(
                      selectionOptions, _scrollController, selectedStep1Item,
                      value:
                          Provider.of<OnBoardingViewModel>(context).getUserType)
                  : OnBoardingStep4(
                      Provider.of<OnBoardingViewModel>(context, listen: false)
                          .getUserType,
                      Provider.of<OnBoardingViewModel>(context, listen: false)
                          .getUserPhoneNo,
                      (RegistrationModel data) =>
                          submitRegistrationForm(context, data)),
            ],
          ),
        ),
      ),
    ));
  }
}
