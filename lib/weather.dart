class Weather {
  // ignore: prefer_typing_uninitialized_variables
  late var cityName;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  late var Temp;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  late var Wind;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  late var Main;

  Weather(var cn, var t, var w, var m) {
    cityName = cn;
    Temp = t;
    Wind = w;
    Main = m;
  }

  getName() {
    return cityName;
  }

  getTemp() {
    return Temp;
  }

  getWind() {
    return Wind;
  }

  getMain() {
    return Main;
  }

  setName(var n) {
    cityName = n;
  }

  setTemp(var a) {
    Temp = a;
  }

  setWind(var a) {
    Wind = a;
  }

  setMain(var m) {
    Main = m;
  }
}

extension StringExtension on String {
  String capitalize() {
    // ignore: unnecessary_this
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
