import 'package:flutter/cupertino.dart';

class BottomNavViewModel extends ChangeNotifier {
  BottomNavViewModel();
  int _tabIndex = 0;

  int get getTabIndex => _tabIndex;

  setTabIndex(int index, {bool rebuild = true}) {
    _tabIndex = index;
    if (rebuild) {
      notifyListeners();
    }
  }
}
