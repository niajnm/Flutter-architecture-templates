import 'package:logging/logging.dart';

abstract class CustomLogger {
  CustomLogger();
  Logger logger = Logger('');

  void info(String msg);

  void warning(String msg);

  void shout(String msg);

  void severe(String msg);
}
