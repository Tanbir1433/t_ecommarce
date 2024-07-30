import 'package:flutter/material.dart';
import '../../../../../common/widget/circular_shape.dart';
import '../../../../../common/widget/curved_edges/curve_widget.dart';
import '../../../../../utils/constants/colors.dart';

class PrimaryHeader extends StatelessWidget {
  final Widget child;
  const PrimaryHeader({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CurveWidget(
      child: Material(
        color: TColors.primary,
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularShape(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),),
              Positioned(
                top: 100,
                right: -300,
                child: CircularShape(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}