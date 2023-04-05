import 'package:chickin_weighting_scale/app/theme/app_color.dart';
import 'package:flutter/material.dart';

AppBar app_bar(
    {required String title,
    required String subtitle,
    required BuildContext context}) {
  return AppBar(
    elevation: 0.8,
    backgroundColor: mobile_chickin_layer_1,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
    ),
    shadowColor: global_palette_gray_100,
    toolbarHeight: 56.0,
    flexibleSpace: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22.0),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12.0),
        )
      ],
    ),
  );
}
