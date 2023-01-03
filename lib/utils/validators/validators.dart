import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/logger/Log.dart';

bool isPhoneNumberValid(dynamic phoneNumber) {
  serviceLocator.get<Log>().info("The phone is $phoneNumber");
  // ignore: unnecessary_string_escapes
  RegExp regExp = RegExp(
    r"01[3-9]\d{8}$",
  );
  return regExp.hasMatch(phoneNumber.toString());
}
