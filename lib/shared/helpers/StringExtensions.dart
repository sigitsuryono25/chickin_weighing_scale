import 'package:intl/intl.dart';

extension StringExtension on String {
  String moneyFormat() {
    var value = this;
    if (length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    else{
      return value;
    }
  }

}
