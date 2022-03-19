import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class pd extends ChangeNotifier {
  int password = 0;

  setPassword(int a) {
    password = a;
  }

  getPassword() {
    return password;
  }
}
