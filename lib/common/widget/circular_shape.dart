import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class CircularShape extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Widget? child;

  const CircularShape({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 4000,
    this.backgroundColor = TColors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
