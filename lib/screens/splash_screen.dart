import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/constants/numeric_constants.dart';
import 'package:flutter_test_project/screens/home_screen.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SPLASH_SCREEN";
  final IconData iconData;
  const SplashScreen({Key? key, required this.iconData}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: NumericConstants.animationDuration)
      ..repeat(reverse: true);
    _animation = NumericConstants.animationTween.animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    Future.delayed(NumericConstants.splashScreenDuration, () {
      StateService.pushNamedAndRemoveAll(toBePushed: HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blueShade1,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Icon(
            Icons.apple,
            color: MyColors.blueShade2,
            size: 100.r,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
