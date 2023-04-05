import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

dateTimePicker(BuildContext context, Function(DateTime? p1) callback) {
  DateTime? dateTime;
  DatePicker.showDateTimePicker(context, showTitleActions: true,
      onConfirm: (date) {
    dateTime = date;
    callback(dateTime);
  });
}

String formattedDateTime(DateTime dateTime,
    {String format = "yyyy-MM-dd HH:mm:ss"}) {
  final DateFormat df = DateFormat(format);
  return df.format(dateTime);
}

String getCurrentDateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
  final DateTime dt = DateTime.now();
  final DateFormat df = DateFormat(format);
  return df.format(dt);
}
