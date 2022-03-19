import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hasoi/projects.dart';
import 'package:hasoi/theme.dart';
import 'package:hasoi/today.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import 'e_c.dart';
import 'e_s.dart';
import 'home.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  var currDt = DateTime.now();
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    bool chosen = _themeChanger.getchosen();

    final panelheightb = MediaQuery.of(context).size.height * .15;
    final panelheighte = MediaQuery.of(context).size.height * .64;

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
          "About Me".tr(),
          style: TextStyle(
              fontFamily: 'Header',
              fontSize: w * .07,
              fontWeight: FontWeight.bold),
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
                          fontFamily: 'Header',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight + const Alignment(0, .9),
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
                                setState(() {
                                  EasyLocalization.of(context)!
                                      .setLocale(const Locale("en", "US"));
                                  _themeChanger.setAr(false);
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
                              setState(() {
                                EasyLocalization.of(context)!
                                    .setLocale(const Locale("ar", "IQ"));
                                _themeChanger.setAr(true);
                              });
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

      /////////////////////////////////////////////////////
      body: SlidingUpPanel(
        minHeight: panelheightb,
        maxHeight: panelheighte,
        color: _themeChanger.getchosen()
            ? const Color(0xff424242)
            : const Color.fromRGBO(141, 152, 206, 1),
        // Colors.grey
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: h * .23,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: w,
                    height: 2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 227, 227, .2),
                    ),
                  )),
              Positioned(
                  top: h * .28,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * .06, vertical: h * .015),
                        width: w * .85,
                        height: h * .395,
                        decoration: BoxDecoration(
                            color: _themeChanger.getchosen()
                                ? const Color.fromRGBO(240, 227, 227, 1)
                                : const Color.fromRGBO(141, 152, 206, 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "About Me".tr(),
                          style: TextStyle(
                              color: _themeChanger.getchosen()
                                  ? Colors.black
                                  : Colors.white,
                              fontFamily: 'Name',
                              fontWeight: FontWeight.bold,
                              fontSize: w * .05),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: h * .235,
                  right: _themeChanger.getAr() ? w * .015 : w * .04,
                  child: Transform.rotate(
                      angle: 30 * math.pi / 180,
                      child: Icon(
                        FontAwesomeIcons.graduationCap,
                        size: w * .15,
                        color: _themeChanger.getchosen()
                            ? const Color.fromRGBO(205, 182, 157, 1)
                            : const Color.fromRGBO(58, 67, 111, 1),
                      ))),
              Positioned(
                  top: h * .335,
                  child: Container(
                    width: w * .75,
                    height: h * .325,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: _themeChanger.getchosen()
                          ? Colors.white
                          : const Color.fromRGBO(166, 177, 225, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text("Data Holder",
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.black
                                : Colors.white,
                            fontFamily: 'Name',
                            fontWeight: FontWeight.w600,
                            fontSize: w * .038)),
                  )),
              Positioned(
                  bottom: h * .345,
                  right: _themeChanger.getAr() ? w * .7 : w * .14,
                  child: Icon(
                    FontAwesomeIcons.university,
                    size: h * .08,
                    color: _themeChanger.getchosen()
                        ? const Color.fromRGBO(205, 182, 157, 1)
                        : const Color.fromRGBO(58, 67, 111, 1),
                    // color: Colors.black,
                  )),
              Positioned(
                top: w * .01,
                left: w * .01,
                right: w * .01,
                child: Row(
                  children: [
                    Container(
                      height: h * .19,
                      width: w * .4,
                      padding: EdgeInsets.all(h * .05),
                      child: Image(
                        image: const NetworkImage(
                            'https://logos-world.net/wp-content/uploads/2020/12/Batman-Logo.png'),
                        width: w * .01,
                        height: h * .03,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _themeChanger.getchosen()
                            ? const Color.fromRGBO(240, 227, 227, 1)
                            : const Color.fromRGBO(141, 152, 206, 1),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: h * .15,
                      width: 2,
                      color: const Color.fromRGBO(240, 227, 227, .2),
                      // decoration: BoxDecoration()
                    )
                  ],
                ),
              ),
              Positioned(
                right: _themeChanger.getAr() ? w * .47 : w * .015,
                top: h * .035,
                child: Text(
                  "Name: Mhamad Raad".tr(),
                  style: TextStyle(
                      fontFamily: 'Name',
                      fontSize: w * .055,
                      fontWeight: FontWeight.bold,
                      letterSpacing: w * .0014,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : Colors.black),
                ),
              ),
              Positioned(
                right: _themeChanger.getAr() ? w * .47 : w * .33,
                top: h * .082,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Age:".tr(),
                          style: TextStyle(
                              fontFamily: 'Name',
                              fontSize: w * .055,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                              color: _themeChanger.getchosen()
                                  ? const Color.fromRGBO(240, 227, 227, 1)
                                  : Colors.black)),
                      TextSpan(
                        text: " ${currDt.year - 2001}".tr(),
                        style: TextStyle(
                            fontFamily: 'Name',
                            fontSize: w * .055,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .5,
                            color: _themeChanger.getchosen()
                                ? const Color.fromRGBO(240, 227, 227, 1)
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: _themeChanger.getAr() ? w * .47 : w * .012,
                top: h * .13,
                child: Text(
                  "Adress: Sulaymaniyah".tr(),
                  style: TextStyle(
                      fontFamily: 'Name',
                      fontSize: w * .055,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : Colors.black),
                ),
              ),
            ],
          ),
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      ),
    );
  }
}

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  bool show1 = false, show2 = false, c1 = false, c2 = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Container(
      margin: EdgeInsets.only(top: h * .04),
      child: Stack(
        children: [
          Positioned(
            left: w * .45,
            right: w * .45,
            child: Container(
              height: h * .007,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18), bottom: Radius.circular(18)),
                color: _themeChanger.getchosen()
                    ? const Color.fromRGBO(240, 227, 227, .88)
                    : const Color.fromRGBO(58, 67, 111, 1),
              ),
            ),
          ),
          Positioned(
              top: h * .015,
              left: 0,
              right: 0,
              child: Text(
                "Information".tr(),
                style: TextStyle(
                    fontFamily: 'Header',
                    fontSize: w * .14,
                    fontWeight: FontWeight.bold,
                    color: _themeChanger.getchosen()
                        ? const Color.fromRGBO(240, 227, 227, 1)
                        : Colors.black),
                textAlign: TextAlign.center,
              )),

          Positioned(
            top: h * .13,
            left: _themeChanger.getAr() ? w * .07 : w * .08,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    show1 = true;
                    show2 = false;
                    c1 = true;
                    c2 = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: _themeChanger.getchosen()
                      ? c1
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(240, 227, 227, .88)
                      : c1
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(240, 227, 227, .85),
                ),
                child: Text(
                  "Achievements".tr(),
                  style: TextStyle(
                      fontFamily: 'Name',
                      fontSize: w * .06,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Positioned(
            top: h * .13,
            right: _themeChanger.getAr() ? w * .08 : w * .07,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    show1 = false;
                    show2 = true;
                    // Color = const Color.fromRGBO(244, 238, 255, 1);
                    c2 = true;
                    c1 = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: _themeChanger.getchosen()
                      ? c2
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(240, 227, 227, .88)
                      : c2
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(
                              240, 227, 227, .85), // background
                ),
                child: Text(
                  "Hobbies".tr(),
                  style: TextStyle(
                      fontFamily: 'Name',
                      fontSize: w * .06,
                      color: const Color.fromRGBO(0, 0, 0, .8),
                      fontWeight: FontWeight.bold),
                )),
          ),
          Positioned(
              top: h * .25,
              child: Visibility(
                  visible: show1,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                        color: Color.fromRGBO(240, 227, 227, 1)),
                    height: h * .3,
                    width: w * .9,
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .04, vertical: w * .03),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "i am box1 luhyxrdgobnositehuvn",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Body',
                          fontSize: w * .04,
                          fontWeight: FontWeight.w600),
                    ),
                  ))),
          // ignore: avoid_print

          Positioned(
              top: h * .25,
              child: Visibility(
                visible: show2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    color: Color.fromRGBO(240, 227, 227, 1),
                  ),
                  height: h * .3,
                  width: w * .9,
                  padding: EdgeInsets.symmetric(
                      horizontal: w * .04, vertical: w * .03),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "i am box2",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Body',
                        fontSize: w * .04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
