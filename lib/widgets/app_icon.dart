import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/helper.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? iconBackGroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;

  AppIcon({
    Key? key,
    required this.icon,
    this.iconBackGroundColor = const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size = 40,
    this.iconSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: iconBackGroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize ==0 ? HelperClass.height16:iconSize,
      ),
    );
  }
}
