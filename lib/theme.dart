import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(141, 152, 206, 1),
        foregroundColor: Color.fromRGBO(0, 0, 0, 1)),
    iconTheme:
        const IconThemeData(color: Color.fromRGBO(49, 18, 73, 1), size: 40),
    canvasColor: const Color.fromRGBO(166, 177, 225, 1),
  );
  bool chosen = false;
  bool ar = false;

  ThemeChanger();

  getchosen() => chosen;

  getTheme() => _themeData;
  setchosen(bool a) {
    chosen = a;
  }

  getAr() => ar;
  setAr(bool a) {
    ar = a;
  }

  setTheme(ThemeData a) {
    _themeData = a;
    notifyListeners();
  }
}
