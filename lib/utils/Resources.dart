import 'package:flutter/cupertino.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/colors/AppColors.dart';
import 'package:onefish/utils/variables/AppVariables.dart';
import 'package:onefish/utils/styles/CustomStyles.dart';
import 'package:onefish/utils/lang/bn.dart';
import 'package:onefish/utils/lang/Lang.dart';
import 'package:onefish/utils/lang/en.dart';
import 'package:onefish/utils/logger/Log.dart';

class Resources {
  final BuildContext _context;

  const Resources(this._context);

  Lang get lang {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'en':
        return const Bengali();
      default:
        return const English();
    }
  }

  AppColors get colors {
    return serviceLocator.get<AppColors>();
  }

  CustomStyles get styles {
    return CustomStyles(_context);
  }

  AppVariables get variables {
    return serviceLocator.get<AppVariables>();
  }

  Log get logger {
    return serviceLocator.get<Log>();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
