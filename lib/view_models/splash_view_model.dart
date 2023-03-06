import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }
}
