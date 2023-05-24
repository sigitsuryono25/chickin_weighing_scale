import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String formattedDateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
    final DateFormat df = DateFormat(format);
    return df.format(this);
  }
}