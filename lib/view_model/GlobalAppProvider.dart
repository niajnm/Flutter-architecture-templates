import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalAppProvider extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double _launchCount = 0;
  bool _isAppReady = false;

  /// GET & Set Launch Count
  double get getLaunchCount => _launchCount;

  void setLaunchCount() async {
    SharedPreferences prefs = await _prefs;
    double launchCount = prefs.getDouble('launchCount') ?? 0;
    _launchCount = launchCount + 1;
    prefs.setDouble('launchCount', _launchCount);
    notifyListeners();
  }

  /// GET & Set Launch Count
  bool get getIsAppReady => _isAppReady;

  void setIsAppReady() async {
    _isAppReady = true;
    notifyListeners();
  }
}
