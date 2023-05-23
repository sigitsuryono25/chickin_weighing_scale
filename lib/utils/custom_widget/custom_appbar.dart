import 'package:chickin_weighing_scale/app/ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color,
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  CustomAppBar(
      {required this.child,
      this.height = kToolbarHeight,
      this.color = global_palette_gray_100});
}
