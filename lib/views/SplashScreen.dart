import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:onefish/views/Signup/CollectUserData.dart';
import 'package:onefish/views/Signup/UserOnBoardingPage.dart';
import 'package:onefish/views/HomePage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:onefish/widgets/themeItems/AsyncLoader.dart';
import 'package:provider/provider.dart';
import 'package:onefish/view_model/OnBoardingViewModel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  bool? isLoggedIn;
  int? showWhichStep;
  late dynamic _getOnBoardingProviderContext;
  late dynamic _getLoadingProviderContext;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.resources.logger
        .info("SplashScreen didChangeDependencies fired $isLoggedIn");
    context.dependOnInheritedWidgetOfExactType();
    _getOnBoardingProviderContext =
        Provider.of<OnBoardingViewModel>(context, listen: false);
    _getLoadingProviderContext =
        Provider.of<LoaderModelView>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _getOnBoardingProviderContext.setLoggedInStatus(
        loginStatus: isLoggedIn ?? false, rebuild: false);
    showWhichStep = _getOnBoardingProviderContext.getShowWhichStep;
    _getLoadingProviderContext.setShowLoader(true, rebuild: false);
    super.dispose();
  }

  Future<bool> getLoggedInStatus(BuildContext context) async {
    if (mounted) {
      if (prefs == null) {
        prefs = await SharedPreferences.getInstance();
        bool loginStatus = prefs?.getBool('isLoggedIn') ?? false;
        context.resources.logger.info("Is User Logged in? $loginStatus");
        context.resources.logger.info("Widget Mounted & saving Login Status");
        context.resources.logger.info("which step $showWhichStep");
        return loginStatus;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      backgroundColor: context.resources.colors.neutral50,
      duration: 0,
      screenFunction: () async {
        isLoggedIn = await getLoggedInStatus(context);
        return AsyncLoader(
            key: const Key('AppLoader'),
            child: isLoggedIn == true
                ? HomePage()
                : (showWhichStep ?? 1) < 3
                    ? const UserOnBoardingPage()
                    : const CollectUserData());
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider.value(value: LoaderModelView()),
        //     ChangeNotifierProvider.value(value: GlobalAppProvider()),
        //     ChangeNotifierProvider.value(value: OnBoardingViewModel()),
        //   ],
        //   child: AsyncLoader(
        //       key: const Key('AppLoader'),
        //       child: isLoggedIn ?? false
        //           ? const HomePage()
        //           : (showWhichStep ?? 1) < 3
        //               ? const UserOnBoardingPage()
        //               : const CollectUserData()),
        // );
      },
      animationDuration: const Duration(seconds: 0),
      splash: Image.asset('assets/images/logos/full_color_logo.png',
          fit: BoxFit.contain),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
