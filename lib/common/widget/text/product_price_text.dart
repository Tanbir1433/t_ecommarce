import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final String currencySign, price;
  final int maxLine;
  final bool isLarge, lineThrow;

  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style: isLarge
          ? Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(decoration: lineThrow ? TextDecoration.lineThrough : null)
          : Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(decoration: lineThrow ? TextDecoration.lineThrough : null),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
