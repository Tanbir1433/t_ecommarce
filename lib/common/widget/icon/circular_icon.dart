import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = TSizes.lg,
    required this.icon,
  });
  final VoidCallback? onPressed;
  final Color? backgroundColor, iconColor;
  final double? size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor != null ? backgroundColor! : THelperFunctions.isDarkMode(context) ? TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
    );
  }
}
