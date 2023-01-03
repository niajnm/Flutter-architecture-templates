import 'package:onefish/utils/logger/CustomLogger.dart';

class Log extends CustomLogger {
  Log();

  @override
  void info(String msg) {
    logger.info(msg);
  }

  @override
  void warning(String msg) {
    logger.warning(msg);
  }

  @override
  void shout(String msg) {
    logger.shout(msg);
  }

  @override
  void severe(String msg) {
    logger.severe(msg);
  }
}
