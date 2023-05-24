extension BooleanExtension on bool{
  int booleanToInt() {
    if (this) {
      return 1;
    } else {
      return 0;
    }
  }
}

extension IntExtesion on int?{
  bool intToBoolean() {
    return this == 1 ? true : false;
  }
}