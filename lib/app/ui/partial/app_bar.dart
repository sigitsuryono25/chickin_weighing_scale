import 'package:chickin_weighing_scale/utils/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            : const SizedBox(
          height: 0.0,
        )
      ],
    ),
  );
}

CustomAppBar customAppBar(String title) {
  return CustomAppBar(
    child: Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 22.0),
      ),
    ),
  );
}

CustomAppBar appBarWithSubtitle(String title, String subtitle) {
  return CustomAppBar(
    child: Column(
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

CustomAppBar appBarWithLeftIcon({required String title,
  IconData leftIcon = Icons.arrow_back_ios_new_rounded,
  required BuildContext context}) {
  return CustomAppBar(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(leftIcon),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(fontSize: 22.0),
          ),
        )
      ],
    ),
  );
}

CustomAppBar appBarWithSubtitleLeftRightIcon({required String title,
  String? subtitle,
  IconData leftIcon = Icons.arrow_back_ios_new_rounded,
  Obx? rightIcon,
  Function? leftAction,
  Function? rightAction,
  required BuildContext context}) {
  return CustomAppBar(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(leftIcon),
            onPressed: () {
              if (leftAction == null) {
                Navigator.pop(context);
              } else {
                leftAction.call();
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22.0),
              ),
              Text(
                "$subtitle",
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: rightIcon ?? const Icon(Icons.sync),
            onPressed: () {
              if (rightAction != null) {
                rightAction.call();
              }
            },
          ),
        )
      ],
    ),
  );
}

CustomAppBar appBarWithLeftRightIcon({required String title,
  IconData leftIcon = Icons.arrow_back_ios_new_rounded,
  Obx? rightIcon,
  Function? leftAction,
  Function? rightAction,
  required BuildContext context}) {
  return CustomAppBar(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(leftIcon),
            onPressed: () {
              if (leftAction == null) {
                Navigator.pop(context);
              } else {
                leftAction.call();
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: rightIcon ?? const Icon(Icons.sync),
            onPressed: () {
              if (rightAction != null) {
                rightAction.call();
              }
            },
          ),
        )
      ],
    ),
  );
}