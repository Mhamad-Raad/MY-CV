import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasoi/p1.dart';
import 'package:hasoi/p2.dart';
import 'package:hasoi/theme.dart';
import 'package:hasoi/today.dart';
import 'package:provider/provider.dart';

import 'aboutme.dart';
import 'e_c.dart';
import 'e_s.dart';
import 'home.dart';

// ignore: camel_case_types
class projects extends StatefulWidget {
  const projects({Key? key}) : super(key: key);

  @override
  _projectsState createState() => _projectsState();
}

// ignore: camel_case_types
class _projectsState extends State<projects> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(top: 5),
          icon: Icon(
            _themeChanger.getchosen()
                ? Icons.light_mode_rounded
                : FontAwesomeIcons.moon,
            size: _themeChanger.getchosen() ? 30 : 28,
          ),
          onPressed: () {
            setState(() {
              bool chosen = _themeChanger.getchosen();
              chosen = !chosen;
              _themeChanger.setchosen(chosen);
              if (chosen == true) {
                setState(() {
                  _themeChanger.setTheme(
                    ThemeData(
                      canvasColor: Colors.grey[900],
                      appBarTheme: const AppBarTheme(
                          backgroundColor: Color(0xFF424242),
                          foregroundColor: Colors.white),
                      iconTheme:
                          const IconThemeData(color: Colors.white, size: 40),
                    ),
                  );
                });
              } else {
                _themeChanger.setTheme(ThemeData(
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Color.fromRGBO(141, 152, 206, 1),
                      foregroundColor: Color.fromRGBO(0, 0, 0, 1)),
                  iconTheme: const IconThemeData(
                      color: Color.fromRGBO(49, 18, 73, 1), size: 40),
                  canvasColor: const Color.fromRGBO(166, 177, 225, 1),
                ));
              }
            });
          },
        ),
        centerTitle: true,
        title: Text(
          "Flutter Designs".tr(),
          style: const TextStyle(
              fontFamily: 'Header', fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      endDrawer: Drawer(
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
                          fontSize: 20.0,
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
                          fontFamily: 'Header'.tr(),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight + const Alignment(0, .8),
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
              width: 100,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                          style: const TextStyle(
                              fontSize: 25,
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
                        height: 22,
                        width: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: InkWell(
                              onTap: () {
                                _themeChanger.setAr(false);
                                setState(() {
                                  EasyLocalization.of(context)!
                                      .setLocale(const Locale("en", "US"));
                                });
                              },
                              child: const Text(
                                "EN",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 2,
                        color: _themeChanger.getchosen()
                            ? const Color.fromRGBO(120, 120, 120, 1)
                            : const Color.fromRGBO(58, 67, 111, 1),
                      ),
                      SizedBox(
                          key: GlobalKey(),
                          // margin: const EdgeInsets.only(left: 1, right: 2),
                          height: 22,
                          width: 50,
                          child: InkWell(
                            key: GlobalKey(),
                            onTap: () {
                              _themeChanger.setAr(true);
                              EasyLocalization.of(context)!
                                  .setLocale(const Locale("ar", "IQ"));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "AR",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: w * .9,
          height: h * .7,
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
            color: _themeChanger.getchosen()
                ? Colors.grey[800]
                : const Color.fromRGBO(141, 152, 206, 1),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/p1.png'),
                                fit: BoxFit.cover),
                          ),
                          width: w * .33,
                          height: h * .16,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: h * .05,
                              decoration: BoxDecoration(
                                color: _themeChanger.getchosen()
                                    ? Colors.grey[900]
                                    : const Color.fromRGBO(58, 67, 111, 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Design 1".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? const Color.fromRGBO(
                                              240, 227, 227, 1)
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: w * .05),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const p1()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/p2.png'),
                                fit: BoxFit.cover),
                          ),
                          width: w * .33,
                          height: h * .16,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: h * .05,
                              decoration: BoxDecoration(
                                color: _themeChanger.getchosen()
                                    ? Colors.grey[900]
                                    : const Color.fromRGBO(58, 67, 111, 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Design 2".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? const Color.fromRGBO(
                                              240, 227, 227, 1)
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: w * .05),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const p2()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
