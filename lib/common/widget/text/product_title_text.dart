import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  final String text;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;

  const ProductTitleText({
    super.key,
    required this.text,
    this.smallSize = false,
    this.maxLine = 2,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}
