import 'package:flutter/cupertino.dart';
import 'curved_shape.dart';

class CurveWidget extends StatelessWidget {
  final Widget? child;
  const CurveWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurbedShape(),
      child: child,
    );
  }
}