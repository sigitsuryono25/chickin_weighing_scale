import 'package:logger/logger.dart';

void loggingError({required String message, StackTrace? ex}) {
  Logger().e("${DateTime.now()}\t\t\t $message");
}

void printDebug({required String message}) {
  Logger().d("${DateTime.now()}\t\t\t $message");
}
