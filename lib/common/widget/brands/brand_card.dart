import 'package:flutter/material.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';
import 'package:t_store/feature/shop/model/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../image/circular_image.dart';

class BrandCard extends StatelessWidget {
  final bool showBanner;
  final void Function()? onTap;
  final BrandModel brand;
  const BrandCard({
    super.key,
    required this.showBanner,
    this.onTap, required this.brand,
  });

  @override
  Widget build(BuildContext context) {
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
                  image: brand.image,
                  fit: BoxFit.cover,
                  isNetworkImage: true,
                  backgroundColor: Colors.transparent,
                  //overlayColor: dark ? TColors.white : TColors.white,
                ),
              ),

              /// Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandTitleWithVerifyIcon(
                      title: brand.name,
                      brandTextSizes: TextSizes.large,
                    ),
                    Text(
                      '${brand.productsCount ?? 0} Products',
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
