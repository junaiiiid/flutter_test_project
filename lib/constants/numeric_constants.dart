// Flutter imports:
import 'package:flutter/animation.dart';

class NumericConstants{
  NumericConstants._();

  static Size artBoardSize = const Size(430, 932);

  static Tween<double> animationTween = Tween<double>(begin: 1.0,end: 1.3,);

  static Duration animationDuration = const Duration(milliseconds: 800);

  static Duration splashScreenDuration = const Duration(seconds: 3);

  static double appBarElevation = 0.0;
}
