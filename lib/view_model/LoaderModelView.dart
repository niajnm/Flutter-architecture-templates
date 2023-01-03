import 'package:flutter/cupertino.dart';

class LoaderModelView extends ChangeNotifier {
  LoaderModelView();
  bool _showLoader = false;

  bool get getShowLoader => _showLoader;

  setShowLoader(bool shouldShow, {bool rebuild = true}) {
    _showLoader = shouldShow;
    if (rebuild) {
      notifyListeners();
    }
  }
}
