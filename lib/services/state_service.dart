import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/screens/home_screen.dart';
import 'package:flutter_test_project/screens/splash_screen.dart';
import 'package:flutter_test_project/view_models/home_view_model.dart';
import 'package:flutter_test_project/view_models/splash_view_model.dart';

class StateService {
  StateService._();

  ///GLOBAL NAVIGATOR KEY
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ///GLOBAL SCAFFOLD KEY
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  ///INITIAL ROUTE APP NAVIGATES TO
  static String get initialRoute => SplashScreen.id;

  ///GLOBAL BUILD CONTEXT
  static BuildContext get context => navigatorKey.currentState!.context;

  ///GLOBAL OVERLAY CONTEXT FOR DRAWERS
  static BuildContext get overlayContext => navigatorKey.currentState!.overlay!.context;

  static ChangeNotifierProvider<HomeViewModel> homeStateHandler =
      ChangeNotifierProvider((ref) => HomeViewModel());

  ///LIST OF ROUTES PRESENT IN APP
  static Map<String, Widget Function(BuildContext)> get routes => {
    HomeScreen.id: (context) => const HomeScreen(),
  };

  ///PUSH NAMED ROUTE
  static pushNamed({required String routeName, bool replace = false}) {
    if (replace) {
      navigatorKey.currentState!.pushReplacementNamed(routeName);
    } else {
      navigatorKey.currentState!.pushNamed(routeName);
    }
  }

  ///PUSHING A UNNAMED ROUTE WHICH REQUIRES AN ARGUMENT
  static push({required var route, bool replace = false}) {
    if (replace) {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => route),
      );
    } else {
      navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => route),
      );
    }
  }

  ///POP ROUTE
  static pop() {
    navigatorKey.currentState!.pop();
  }

  ///PUSH NAMED AND REMOVE UNTIL
  static pushNamedAndRemoveUntil(
      {required String toBePushed, required String toBeRemovedUntil}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        toBePushed, ModalRoute.withName(toBeRemovedUntil));
  }

  ///PUSH NAMED AND REMOVE ALL
  static pushNamedAndRemoveAll({required String toBePushed}) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(toBePushed, (Route<dynamic> route) => false);
  }
}
