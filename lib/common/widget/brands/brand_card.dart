import 'package:flutter/material.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../image/circular_image.dart';

class BrandCard extends StatelessWidget {
  final bool showBanner;
  final void Function()? onTap;
  const BrandCard({
    super.key,
    required this.showBanner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        shape: showBanner
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                side: const BorderSide(color: TColors.grey),
              ): Border.all(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Row(
            children: [
              Flexible(
                child: CircularImage(
                  image: TImages.nikeLogo,
                  isNetworkImage: false,
                  backgroundColor: Colors.transparent,
                  overlayColor: dark ? TColors.white : TColors.black,
                ),
              ),

              /// Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrandTitleWithVerifyIcon(
                      title: 'Nike',
                      brandTextSizes: TextSizes.large,
                    ),
                    Text(
                      '256 Products',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
