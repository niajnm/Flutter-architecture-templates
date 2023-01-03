import 'package:get_it/get_it.dart';
import 'package:onefish/utils/logger/Log.dart';
import 'package:onefish/utils/colors/AppColors.dart';
import 'package:onefish/utils/stream/InternetConnectivity.dart';
import 'package:onefish/utils/variables/AppVariables.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

///https://blog.logrocket.com/dependency-injection-flutter-using-getit-injectable/
///https://medium.com/nerd-for-tech/implement-service-locator-design-pattern-with-get-it-flutter-5e50671bbbcb
///
final serviceLocator = GetIt.instance;

class ServiceLocator {
  static Future<void> setUpServiceLocator() async {
    //Creating a singleton of Logger
    serviceLocator.registerLazySingleton<Log>(() => Log());
    //Creating a singleton of InternetConnectivity
    serviceLocator.registerLazySingleton<InternetConnectivity>(
        () => InternetConnectivity(Connectivity()));
    //Creating a singleton of AppColors
    serviceLocator.registerLazySingleton<AppColors>(() => const AppColors());
    //Creating a singleton of AppVariables
    serviceLocator.registerLazySingleton<AppVariables>(() => AppVariables());
  }
}
//Service Locator Implemented Via GetIt
