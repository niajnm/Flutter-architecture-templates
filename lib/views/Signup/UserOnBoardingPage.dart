import 'package:flutter/material.dart';
import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:onefish/widgets/themeItems/BackBtnManual.dart';
import 'package:onefish/widgets/themeItems/OneFishTopLogo.dart';
import 'package:onefish/widgets/userOnBoarding/OnBoardingStep1.dart';
import 'package:onefish/widgets/userOnBoarding/OnBoardingStep2.dart';
import 'package:onefish/widgets/userOnBoarding/OnBoardingBackground.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/view_model/OnBoardingViewModel.dart';
import 'package:provider/provider.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class UserOnBoardingPage extends StatefulWidget {
  const UserOnBoardingPage({Key? key}) : super(key: key);

  @override
  State<UserOnBoardingPage> createState() => _UserOnBoardingPageState();
}

class _UserOnBoardingPageState extends State<UserOnBoardingPage>
    with TickerProviderStateMixin {
  bool showStep2 = false;
  double logoPosition = 250.h;
  double loginFormOpacity = 0;
  late AnimationController _logoAnimController;
  late AnimationController _loginFormAnimController;
  late Animation<double> _logoAnimation;
  late Animation<double> _loginAnimation;
//Loading Animation Params
  Duration loaderAnimTime = const Duration(milliseconds: 650);
  Duration loginAnimTim = const Duration(milliseconds: 650);

  // Animation<double> logoCurvedAnim(AnimationController controller) =>
  //     Tween<double>(begin: logoPosition, end: 120.h).animate(controller);

  @override
  void initState() {
    logoAnimatorHandler();
    loginAnimatorHandler();
    super.initState();
    // setLaunchCount();
  }

  void logoAnimatorHandler() {
    _logoAnimController = AnimationController(
      duration: loaderAnimTime,
      vsync: this,
    )..repeat(reverse: false);

    _logoAnimation = Tween<double>(begin: logoPosition, end: 50.h)
        .animate(_logoAnimController)
      ..addListener(() {
        logoPosition = _logoAnimation.value;
        setState(() {});
      });
    _logoAnimController.stop();
  }

  void loginAnimatorHandler() {
    _loginFormAnimController = AnimationController(
      duration: loginAnimTim,
      vsync: this,
    )..repeat(reverse: false);

    _loginAnimation = Tween<double>(begin: loginFormOpacity, end: 1)
        .animate(_loginFormAnimController)
      ..addListener(() {
        loginFormOpacity = _loginAnimation.value;
        setState(() {});
      });
    _loginFormAnimController.stop();
    if (mounted) {
      initializeAnimators();
    }
  }

  @override
  void dispose() {
    _logoAnimController.dispose();
    _loginFormAnimController.dispose();
    super.dispose();
  }

  Future<void> initializeAnimators() async {
    Provider.of<LoaderModelView>(context, listen: false)
        .setShowLoader(true, rebuild: false);
    Provider.of<OnBoardingViewModel>(context, listen: false)
        .initializeOnBoardingPage(
            context, _logoAnimController, _loginFormAnimController);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        OnBoardingBackground(),
        Provider.of<OnBoardingViewModel>(context).getShowWhichStep == 2
            ? Positioned(
                top: 80.h,
                left: context.resources.variables.sidePaddingAmount,
                child: BackBtnManual(
                      () => Provider.of<OnBoardingViewModel>(context,
                              listen: false)
                          .handleStep2BackBtnClick(context),
                      context.resources.colors.white))
            : context.resources.variables.sizedBoxShrink,
        AnimatedContainer(
          curve: Curves.bounceOut,
          duration: loaderAnimTime,
          child: Positioned(
            top: logoPosition,
            child: OneFishTopLogo(
                imageAsset: 'assets/images/logos/full_white_logo.png'),
          ),
        ),
        Positioned(
            top: 150.h,
            left: 0,
            child: AnimatedOpacity(
                curve: Curves.linear,
                duration: loginAnimTim,
                opacity: loginFormOpacity,
                child: Padding(
                    padding: context.resources.styles.sidesPadding(),
                    child: AnimatedCrossFade(
                        firstChild:OnBoardingStep1(
                                Provider.of<OnBoardingViewModel>(context)
                                    .getUserPhoneNo,
                                (String updatedPhone) => Provider.of<OnBoardingViewModel>(context, listen: false)
                                    .handleOnBoardingStep1(context,
                                        phoneNo: updatedPhone))
                            ,
                        secondChild:OnBoardingStep2((String pin) => Provider.of<OnBoardingViewModel>(context, listen: false)
                                .handleOnBoardingStep2(context, pin: pin))
                            ,
                        crossFadeState: Provider.of<OnBoardingViewModel>(context).getShowWhichStep == 1
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: context.resources.variables.animatedTransitionTime)))),
      ]),
    );
  }
}
