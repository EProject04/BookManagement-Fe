import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (getPlatform(context) == TargetPlatform.android) {
      return GlowingOverscrollIndicator(
        child: child,
        showLeading: false,
        showTrailing: false,
        axisDirection: axisDirection,
        color: Theme.of(context).splashColor,
      );
    } else {
      return child;
    }
  }
}