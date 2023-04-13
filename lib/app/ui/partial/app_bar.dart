import 'package:chickin_weighting_scale/app/theme/app_color.dart';
import 'package:flutter/material.dart';

AppBar appBar(
    {required String title,
    required String subtitle,
    required BuildContext context}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: global_palette_gray_100,
    leading: IconButton(
      icon: (Navigator.canPop(context)) ? const Icon(Icons.arrow_back_ios): const SizedBox(),
      onPressed: () {
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
    ),
    shadowColor: global_palette_gray_100,
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
          style: const TextStyle(fontSize: 12.0),
        )
      ],
    ),
  );
}
