import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding, borderRadius;
  final VoidCallback? onTap;
  final BorderSide? border;

  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.borderRadius = TSizes.md, this.onTap, this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: border ?? const BorderSide(
              color: Colors.transparent
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: isNetworkImage?
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: CachedNetworkImage(
                fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 55, height: 55,radius: 55,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ):
            Image(
              fit: fit,
              image: AssetImage(image) ,
              color: overlayColor,
            ),
          ),
        ),
      ),
    );
  }
}
