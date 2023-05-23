import 'package:flutter/material.dart';

import '../theme/app_color.dart';

AppBar appBar(
    {required String title, String? subtitle, required BuildContext context}) {
  return AppBar(
    backgroundColor: global_palette_gray_100,
    leading: IconButton(
      icon: (Navigator.canPop(context))
          ? const Icon(Icons.arrow_back_ios)
          : const SizedBox(),
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
        subtitle != null
            ? Text(
                subtitle,
                style: const TextStyle(fontSize: 12.0),
              )
            : const SizedBox(height: 0.0,)
      ],
    ),
  );
}
