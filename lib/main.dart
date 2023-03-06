// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

// Project imports:
import 'package:flutter_test_project/constants/numeric_constants.dart';
import 'package:flutter_test_project/screens/splash_screen.dart';
import 'package:flutter_test_project/services/state_service.dart';

void main() {
  runApp(const ProviderScope(child: Start()));
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: NumericConstants.artBoardSize,
      minTextAdapt: true,
      builder: (context, child) {
        late IconData iconData;
        iconData = kIsWeb ? Icons.web : Platform.isAndroid ? Icons.android : Icons.apple;

        return MaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          ),
          debugShowCheckedModeBanner: false,
          navigatorKey: StateService.navigatorKey,
          routes: StateService.routes,
          home: SplashScreen(
            iconData: iconData,
          ),
          theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
        );
      },
    );
  }
}
