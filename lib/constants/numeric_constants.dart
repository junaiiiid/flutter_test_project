// Flutter imports:
import 'package:flutter/animation.dart';

// Package imports:
import 'package:responsive_framework/responsive_wrapper.dart';

class NumericConstants{
  NumericConstants._();

  static Size artBoardSize = const Size(430, 932);

  static Tween<double> animationTween = Tween<double>(begin: 1.0,end: 1.3,);

  static Duration animationDuration = const Duration(milliseconds: 800);

  static Duration splashScreenDuration = const Duration(seconds: 3);

  static double appBarElevation = 0.0;

  static List<ResponsiveBreakpoint> responsiveBreakPoints = const [
    ResponsiveBreakpoint.resize(480, name: MOBILE),
    ResponsiveBreakpoint.autoScale(800, name: TABLET),
    ResponsiveBreakpoint.resize(1200, name: DESKTOP),
    ResponsiveBreakpoint.autoScale(2460, name: '4K'),
  ];
}
