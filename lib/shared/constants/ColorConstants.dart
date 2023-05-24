import 'package:flutter/material.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color bgEdittextDisable = Color(0xffe0e0e0);
const Color cBlue50 = Color(0xfff5f8fa);
const Color cBlue100 = Color(0xffd8e8f3);
const Color cBlue200 = Color(0xffb5ccdc);
const Color cBlue300 = Color(0xff849eaf);
const Color cBlue400 = Color(0xff5d798b);
const Color cBlue500 = Color(0xff435d6e);
const Color cBlue600 = Color(0xff2c4759);
const Color cBlue700 = Color(0xff203a4b);
const Color cBlue800 = Color(0xff112a3a);
const Color cBlue900 = Color(0xff041d2d);

const Color gray50 = Color(0xfffafafa);
const Color gray100 = Color(0xfff5f5f5);
const Color gray200 = Color(0xffe0e0e0);
const Color gray300 = Color(0xffcccccc);
const Color gray400 = Color(0xffa3a3a3);
const Color gray500 = Color(0xff7a7a7a);
const Color gray600 = Color(0xff666666);
const Color gray700 = Color(0xff525252);
const Color gray800 = Color(0xff3d3d3d);
const Color gray900 = Color(0xff292929);
const Color layer0 = gray50;
const Color layer1 = white;
const Color buttonColor = Color(0xffC8E6FF);

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
