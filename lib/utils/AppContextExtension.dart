import 'package:flutter/cupertino.dart';
import 'package:onefish/utils/Resources.dart';
// import 'package:onefish/utils/variables/AppVariables.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
