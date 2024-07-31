import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class BannerImage extends StatelessWidget {
  final double? height, width;
  final String imageUrl;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  const BannerImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          color: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
          borderRadius: BorderRadius.circular(borderRadius),
          clipBehavior: Clip.hardEdge,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}