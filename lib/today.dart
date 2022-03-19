import 'dart:convert';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasoi/projects.dart';
import 'package:hasoi/theme.dart';
import 'package:hasoi/weather.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'aboutme.dart';
import 'e_c.dart';
import 'e_s.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

bool chosen = true;

// ignore: camel_case_types
class today extends StatefulWidget {
  const today({Key? key}) : super(key: key);

  @override
  _todayState createState() => _todayState();
}

// ignore: camel_case_types
class _todayState extends State<today> {
  int c1 = 0;

  var headers = ["", "", "", "", "", ""];
  var bodies = ["", "", "", "", "", ""];
  var conclusions = ["", "", ""];
  var urls = ["", "", "", "", "", ""];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reaserches =
      FirebaseFirestore.instance.collection('researches');

  bool v = false;

  Weather weather = Weather("Iraq", 25, 3, "clear");
  @override
  // ignore: override_on_non_overriding_member
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    DateTime now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String date1 = formatter.format(now);

    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    getFeatures();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(top: 5),
          icon: Icon(
            _themeChanger.getchosen()
                ? Icons.light_mode_rounded
                : FontAwesomeIcons.moon,
            size: _themeChanger.getchosen() ? w * .08 : w * .07,
          ),
          onPressed: () {
            setState(() {
              bool chosen = _themeChanger.getchosen();
              chosen = !chosen;
              _themeChanger.setchosen(chosen);
              if (_themeChanger.getchosen() == true) {
                setState(() {
                  _themeChanger.setTheme(
                    ThemeData(
                      canvasColor: Colors.grey[900],
                      appBarTheme: const AppBarTheme(
                          backgroundColor: Color(0xFF424242),
                          foregroundColor: Colors.white),
                      iconTheme:
                          IconThemeData(color: Colors.white, size: w * .12),
                    ),
                  );
                });
              } else {
                _themeChanger.setTheme(ThemeData(
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Color.fromRGBO(141, 152, 206, 1),
                      foregroundColor: Color.fromRGBO(0, 0, 0, 1)),
                  iconTheme: IconThemeData(color: Colors.white, size: w * .12),
                  canvasColor: const Color.fromRGBO(166, 177, 225, 1),
                ));
              }
            });
          },
        ),
        centerTitle: true,
        title: Text(
          DateFormat('EEEE').format(date),
          style: TextStyle(
              fontFamily: 'Header',
              fontSize: w * .09,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      endDrawer: SizedBox(
        width: w * .75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: _themeChanger.getchosen()
                      ? const Color.fromRGBO(240, 227, 227, 1)
                      : const Color.fromRGBO(104, 114, 166, 1),
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: _themeChanger.getchosen()
                            ? const Color.fromRGBO(240, 227, 227, 1)
                            : const Color.fromRGBO(104, 114, 166, 1),
                        backgroundImage: const NetworkImage(
                            'https://static.thenounproject.com/png/1453983-200.png'),
                        radius: 50.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Mhamad Raad'.tr(),
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? const Color.fromRGBO(0, 0, 0, 1)
                                : Colors.white,
                            fontSize: w * .05,
                            fontFamily: 'Header',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + const Alignment(0, .3),
                      child: Text(
                        'Software Engineer'.tr(),
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? const Color.fromRGBO(0, 0, 0, 1)
                                : Colors.white,
                            fontFamily: 'Header',
                            fontWeight: FontWeight.w900,
                            fontSize: w * .035),
                      ),
                    ),
                    Align(
                        alignment:
                            Alignment.centerRight + const Alignment(0, .9),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _themeChanger.getchosen()
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Verified'.tr(),
                              style: TextStyle(
                                color: _themeChanger.getchosen()
                                    ? const Color.fromRGBO(0, 0, 0, 1)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                width: w * .05,
                height: h * 1,
                color: _themeChanger.getchosen()
                    ? const Color(0xFF424242)
                    : const Color.fromRGBO(166, 177, 225, 1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Home".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DarkTheme()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "About Me".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const About()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Education & Certificates".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Ec()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Experience & Skills".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Es()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Projects".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const projects()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Today".tr(),
                            style: TextStyle(
                                fontSize: w * .07,
                                fontFamily: "Header",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const today()));
                          }),
                    ),
                    SizedBox(
                      height: h * .17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // margin: const EdgeInsets.symmetric(horizontal: 6),
                          height: h * .03,
                          width: w * .1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _themeChanger.setAr(false);
                                  EasyLocalization.of(context)!
                                      .setLocale(const Locale("en", "US"));
                                });
                              },
                              child: Text(
                                "EN",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: w * .05,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * .023,
                          width: w * .008,
                          color: _themeChanger.getchosen()
                              ? const Color.fromRGBO(120, 120, 120, 1)
                              : const Color.fromRGBO(58, 67, 111, 1),
                        ),
                        SizedBox(
                            key: GlobalKey(),
                            // margin: const EdgeInsets.only(left: 1, right: 2),
                            height: h * .03,
                            width: w * .15,
                            child: InkWell(
                              key: GlobalKey(),
                              onTap: () {
                                setState(() {
                                  _themeChanger.setAr(true);
                                  EasyLocalization.of(context)!
                                      .setLocale(const Locale("ar", "IQ"));
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "AR",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: w * .05,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: InkWell(
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: w * .08,
                ),
                onTap: () {
                  getData(search.text);
                },
              ),
              title: TextFormField(
                controller: search,
                decoration: InputDecoration(
                  hintText: "Search for city (Iraq/Turkey/London etc...)",
                  hintStyle: TextStyle(fontSize: w * .035),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * .05,
            ),
            Visibility(
              visible: v,
              child: Column(
                children: [
                  SizedBox(
                    width: w,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            weather.getName(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: w * .15,
                            ),
                          ),
                          Text(
                            date1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: w * .03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Visibility(
                      visible: v,
                      child: Container(
                        width: w * .85,
                        height: h * .25,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(58, 67, 111, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: h * .03),
                              alignment: Alignment.bottomLeft,
                              child: Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "${weather.getTemp()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: w * .25),
                                    ),
                                    TextSpan(
                                      text: "C",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: w * .05),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: h * .015),
                              width: w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: w * .05),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Wind Speed: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * .033,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${weather.Wind}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: w * .033,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: " m/s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: w * .02,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: w * .05),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Situation:",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * .033,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " ${weather.Main}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: w * .033,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * .05,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: w * .07),
                child: Text(
                  "Researches",
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 1,
              width: w * .9,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: h * .03,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: h * .2,
                    width: w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: c1 - 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: w * .07,
                              top: h * .01,
                              bottom: h * .01,
                              right: w * .07),
                          child: GestureDetector(
                            onTap: () {
                              _showDialog(context, index);
                            },
                            child: Container(
                              child: buildFeatures(h, w, index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context, var index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(headers[index]),
          content: Text(bodies[index]),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  getFeatures() async {
    await firestore.collection("researches").get().then((querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((result) async {
        setState(() {
          headers[c1] = result['header'];
          bodies[c1] = result['body'];
          conclusions[c1] = result['conclusion'];
          urls[c1] = result['url'];
          // print(urls[c1]);
          c1++;
        });
      });
    });
  }

  buildFeatures(var h, var w, var index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
            image: NetworkImage(urls[index]), fit: BoxFit.cover),
      ),
      width: w * .4,
      height: h * .18,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: h * .05,
          width: w,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(58, 67, 111, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              headers[index],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: w * .05),
            ),
          ),
        ),
      ),
    );
  }

  getData(a) async {
    final response = await http.get(Uri.parse(
        // ignore: unnecessary_brace_in_string_interps
        'https://api.openweathermap.org/data/2.5/weather?q=${a}&appid=19d0c50825fc689ca51d26728cf1569c'));

    if (response.statusCode == 200) {
      v = true;

      // ignore: non_constant_identifier_names
      var Json = jsonDecode(response.body);

      var d = Json["main"];
      var b = Json["weather"];
      var c = Json["wind"];

      weather.setName(Json["name"]);
      weather.setWind(c["speed"]);
      weather.setMain(b[0]["main"]);
      var t = d["temp"];

      t = t - 273.15;
      var t1 = t.toInt();
      weather.setTemp(t1);
    } else {
      v = false;

      // ignore: non_constant_identifier_names, unused_element
      BuildContext(context) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Please request the password before you try again",
          ),
        );
      }
    }
  }
}
