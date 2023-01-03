import 'package:onefish/utils/logger/Log.dart';
import 'package:onefish/view_model/BottomNavViewModel.dart';
import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:onefish/views/Signup/UserOnBoardingPage.dart';
import 'package:onefish/views/Signup/CollectUserData.dart';
import 'package:onefish/views/HomePage.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:provider/provider.dart';
import 'package:onefish/view_model/GlobalAppProvider.dart';
import 'package:onefish/view_model/OnBoardingViewModel.dart';
import 'package:onefish/views/SplashScreen.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await ServiceLocator.setUpServiceLocator();
  initializeLoggerServer();
  serviceLocator.get<Log>().shout('App Initialized Successfully');
  runApp(OneFishApp());
}

void initializeLoggerServer() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class OneFishApp extends StatelessWidget {
  OneFishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: context.resources.variables.screenDesignSize,
        splitScreenMode: false,
        minTextAdapt: true,
        useInheritedMediaQuery: false,
        builder: (BuildContext context, Widget? child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) => LoaderModelView(), lazy: true),
              ChangeNotifierProvider(
                  create: (_) => GlobalAppProvider(), lazy: true),
              ChangeNotifierProvider(
                  create: (_) => OnBoardingViewModel(), lazy: true),
              ChangeNotifierProvider(
                  create: (_) => BottomNavViewModel(), lazy: true),
            ],
            child: MaterialApp(
                navigatorKey: GlobalKey<NavigatorState>(),
                title: context.resources.variables.appName,
                debugShowCheckedModeBanner: false,
                theme: context.resources.styles.appTheme(),
                home: const SplashScreen(),
                // home: CollectUserData(),
                // home: const UserOnBoardingPage(),
                initialRoute: '/',
                routes: {
                  '/onboard': (context) => UserOnBoardingPage(),
                  '/collectuserinfo': (context) => CollectUserData(),
                  '/home': (context) => HomePage(),
                }),
          );
        });
  }
}
