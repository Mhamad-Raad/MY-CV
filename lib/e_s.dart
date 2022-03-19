import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hasoi/projects.dart';
import 'package:hasoi/theme.dart';
import 'package:hasoi/today.dart';
import 'package:provider/provider.dart';

import 'aboutme.dart';
import 'e_c.dart';
import 'home.dart';

class Es extends StatefulWidget {
  const Es({Key? key}) : super(key: key);

  @override
  _EeState createState() => _EeState();
}

class _EeState extends State<Es> {
  bool s1 = false, s2 = false, s3 = false, s4 = false;

  bool selected1 = true, selected2 = true, selected3 = true, selected4 = true;
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
              size: _themeChanger.getchosen() ? w * .08 : w * .07,
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
                            IconThemeData(color: Colors.white, size: w * 0.1),
                      ),
                    );
                  });
                } else {
                  _themeChanger.setTheme(ThemeData(
                    appBarTheme: const AppBarTheme(
                        backgroundColor: Color.fromRGBO(141, 152, 206, 1),
                        foregroundColor: Color.fromRGBO(0, 0, 0, 1)),
                    iconTheme: IconThemeData(
                        color: const Color.fromRGBO(58, 67, 111, 1),
                        size: w * 0.1),
                    canvasColor: const Color.fromRGBO(166, 177, 225, 1),
                  ));
                }
              });
            },
          ),
          centerTitle: true,
          title: Text(
            "Experience & Skills".tr(),
            style: TextStyle(
                fontFamily: 'Header',
                fontSize: w * .075,
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
                        'Mhamad Raad',
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
                        'Software Engineer',
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? const Color.fromRGBO(0, 0, 0, 1)
                                : Colors.white,
                            fontFamily: 'Header',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Align(
                        alignment:
                            Alignment.centerRight + const Alignment(0, .8),
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
                              'Verified',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
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
                                setState(() {
                                  EasyLocalization.of(context)!
                                      .setLocale(const Locale("ar", "IQ"));
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
        body: Stack(children: [
          Positioned(
              right: w * .08,
              top: h * .022,
              child: Icon(
                  _themeChanger.getchosen()
                      ? FontAwesomeIcons.cloudMoon
                      : FontAwesomeIcons.cloudSun,
                  size: w * .11)),
          Positioned(
              left: w * .1,
              top: h * .03,
              child: Icon(FontAwesomeIcons.cloud, size: w * .12)),
          Positioned(
              right: _themeChanger.getAr() ? w * .45 : w * .37,
              top: h * .05,
              child: Icon(FontAwesomeIcons.cloud, size: w * .06)),
          Positioned(
              right: w * 0,
              bottom: h * .05,
              child: Icon(FontAwesomeIcons.tree, size: w * .15)),
          Positioned(
              right: w * .07,
              bottom: h * .051,
              child: Icon(FontAwesomeIcons.tree, size: w * .13)),
          Positioned(
              left: w * .08,
              bottom: h * .05,
              child: Icon(FontAwesomeIcons.tree, size: w * .16)),
          Positioned(
            right: w * .172,
            top: h * .03,
            child: Icon(
              FontAwesomeIcons.mountain,
              size: h * .15,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: w * .85,
                  height: h * .52,
                  padding: EdgeInsets.symmetric(
                      horizontal: w * .05, vertical: h * .01),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: _themeChanger.getchosen()
                        ? const Color(0xFF424242)
                        : const Color.fromRGBO(141, 152, 206, 1),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Experiences & Skills".tr(),
                          style: TextStyle(
                              color: _themeChanger.getchosen()
                                  ? Colors.white
                                  : const Color.fromRGBO(30, 30, 30, 1),
                              fontSize: w * .07,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fun'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Text(
                                "Experiences".tr(),
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : const Color.fromRGBO(30, 30, 30, 1),
                                    fontSize: w * .06,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Fun'),
                              ),
                              onTap: () {
                                setState(() {
                                  selected1 = !selected1;
                                  s1 = !s1;
                                });
                              },
                            ),
                            IconButton(
                              padding: EdgeInsets.only(top: h * .005),
                              icon: Icon(
                                  _themeChanger.getAr()
                                      ? selected1
                                          ? FontAwesomeIcons.chevronLeft
                                          : FontAwesomeIcons.chevronDown
                                      : selected1
                                          ? FontAwesomeIcons.chevronRight
                                          : FontAwesomeIcons.chevronDown,
                                  color: _themeChanger.getchosen()
                                      ? Colors.grey
                                      : const Color.fromRGBO(58, 59, 1, 1),
                                  size: w * .06),
                              onPressed: () {
                                setState(() {
                                  selected1 = !selected1;
                                  s1 = !s1;
                                });
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: s1,
                          child: Container(
                            height: h * .375,
                            width: w * .76,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: _themeChanger.getchosen()
                                  ? Colors.grey[900]
                                  : const Color.fromRGBO(190, 200, 240, 1),
                            ),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  width: w,
                                  height: w * .77,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: _themeChanger.getAr()
                                            ? w * .08
                                            : w * .075,
                                        left: _themeChanger.getAr()
                                            ? w * .7
                                            : w * .01,
                                        child: Container(
                                          width: w * .035,
                                          height: w * .008,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : Colors.black,
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .19,
                                        left: _themeChanger.getAr()
                                            ? w * .21
                                            : w * .06,
                                        child: Text(
                                          " Worked 2 months as a manager at \n Art of Beuaty company."
                                              .tr(),
                                          style: TextStyle(
                                              color: _themeChanger.getchosen()
                                                  ? Colors.grey[350]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * .037),
                                        ),
                                      ),
                                      Positioned(
                                        top: _themeChanger.getAr()
                                            ? w * .22
                                            : w * .21,
                                        left: _themeChanger.getAr()
                                            ? w * .7
                                            : w * .01,
                                        child: Container(
                                          width: w * .035,
                                          height: w * .008,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : Colors.black,
                                        ),
                                      ),
                                      Positioned(
                                        top: h * .025,
                                        left: _themeChanger.getAr()
                                            ? w * .23
                                            : w * .06,
                                        child: Text(
                                          " Worked 2 months as a translator at \n Art of Beuaty company."
                                              .tr(),
                                          style: TextStyle(
                                              color: _themeChanger.getchosen()
                                                  ? Colors.grey[350]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * .037),
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .35,
                                        left: _themeChanger.getAr()
                                            ? w * .7
                                            : w * .01,
                                        child: Container(
                                          width: w * .035,
                                          height: w * .008,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : Colors.black,
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .325,
                                        left: _themeChanger.getAr()
                                            ? w * .12
                                            : w * .06,
                                        child: Text(
                                          " Worked 4 months as a manager at \n M&M Game center center."
                                              .tr(),
                                          style: TextStyle(
                                              color: _themeChanger.getchosen()
                                                  ? Colors.grey[350]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * .037),
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .49,
                                        left: _themeChanger.getAr()
                                            ? w * .7
                                            : w * .01,
                                        child: Container(
                                            width: w * .035,
                                            height: w * .008,
                                            color: _themeChanger.getchosen()
                                                ? Colors.grey[350]
                                                : Colors.black),
                                      ),
                                      Positioned(
                                        top: w * .465,
                                        left: _themeChanger.getAr()
                                            ? w * .23
                                            : w * .06,
                                        child: Text(
                                          " Built a database application and \n maintained it for 2 months for Mirko."
                                              .tr(),
                                          style: TextStyle(
                                              color: _themeChanger.getchosen()
                                                  ? Colors.grey[350]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * .037),
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .63,
                                        left: _themeChanger.getAr()
                                            ? w * .7
                                            : w * .01,
                                        child: Container(
                                          width: w * .035,
                                          height: w * .008,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : Colors.black,
                                        ),
                                      ),
                                      Positioned(
                                        top: w * .605,
                                        left: w * .06,
                                        child: Text(
                                          " Built 2 mini games using Unreal \n Engine 4."
                                              .tr(),
                                          style: TextStyle(
                                              color: _themeChanger.getchosen()
                                                  ? Colors.grey[350]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * .037),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Text(
                                "Skills".tr(),
                                style: TextStyle(
                                  color: _themeChanger.getchosen()
                                      ? Colors.white
                                      : const Color.fromRGBO(30, 30, 30, 1),
                                  fontSize: w * .06,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Fun',
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected2 = !selected2;
                                  s2 = !s2;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                  _themeChanger.getAr()
                                      ? selected2
                                          ? FontAwesomeIcons.chevronLeft
                                          : FontAwesomeIcons.chevronDown
                                      : selected2
                                          ? FontAwesomeIcons.chevronRight
                                          : FontAwesomeIcons.chevronDown,
                                  color: _themeChanger.getchosen()
                                      ? Colors.grey
                                      : const Color.fromRGBO(58, 59, 1, 1),
                                  size: w * .06),
                              onPressed: () {
                                setState(() {
                                  selected2 = !selected2;
                                  s2 = !s2;
                                });
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: s2,
                          child: SizedBox(
                            width: w,
                            height: w * 1,
                            child: Stack(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .55 : w * .03,
                                  top: _themeChanger.getAr()
                                      ? h * .008
                                      : h * .007,
                                  child: Text(
                                    "C++ : ".tr(),
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .057,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .008,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 4.5,
                                      minRating: 4.5,
                                      maxRating: 4.5,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: w * .075,
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            Icons.star,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: Icon(
                                            Icons.star_half,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            Icons.star_outline,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .55 : w * .03,
                                  top: h * .067,
                                  child: Text(
                                    "Java : ",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .057,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .0 : w * .185,
                                  top: h * .067,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 4,
                                      minRating: 4,
                                      maxRating: 4,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.mugHot,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.mugHot,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.mugHot,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .13,
                                  child: Text(
                                    "Web Dev :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .13,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 4,
                                      minRating: 4,
                                      maxRating: 4,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.globe,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.globe,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.globe,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .19,
                                  child: Text(
                                    "Database :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .0 : w * .185,
                                  top: h * .19,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 3,
                                      minRating: 3,
                                      maxRating: 3,
                                      direction: Axis.horizontal,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.database,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.database,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.database,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .25,
                                  child: Text(
                                    "App Dev :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .31,
                                  child: Text(
                                    "Game Dev :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .37,
                                  child: Text(
                                    "Python3 :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * .5 : w * .03,
                                  top: h * .44,
                                  child: Text(
                                    "Networking :",
                                    style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.grey[350]
                                          : const Color.fromRGBO(30, 31, 90, 1),
                                      fontSize: _themeChanger.getAr()
                                          ? w * .043
                                          : w * .05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .44,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 2,
                                      minRating: 2,
                                      maxRating: 2,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.tv,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.tv,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.tv,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .37,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 2,
                                      minRating: 2,
                                      maxRating: 2,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.python,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.python,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.python,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .31,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 2,
                                      minRating: 2,
                                      maxRating: 2,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.gamepad,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.gamepad,
                                            color:
                                                Color.fromRGBO(58, 67, 111, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.gamepad,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      _themeChanger.getAr() ? w * 0 : w * .185,
                                  top: h * .247,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 4,
                                      minRating: 4,
                                      maxRating: 4,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: w * .055,
                                      itemPadding:
                                          const EdgeInsets.only(left: 7),
                                      ratingWidget: RatingWidget(
                                          full: Icon(
                                            FontAwesomeIcons.crown,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    205, 182, 157, 1)
                                                : const Color.fromRGBO(
                                                    58, 67, 111, 1),
                                          ),
                                          half: const Icon(
                                            FontAwesomeIcons.crown,
                                            color:
                                                Color.fromRGBO(96, 81, 184, 1),
                                          ),
                                          empty: Icon(
                                            FontAwesomeIcons.crown,
                                            color: _themeChanger.getchosen()
                                                ? const Color.fromRGBO(
                                                    120, 120, 120, 1)
                                                : const Color.fromRGBO(
                                                    118, 124, 164, 1),
                                          )),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Text(
                                "Soft Skills".tr(),
                                style: TextStyle(
                                  color: _themeChanger.getchosen()
                                      ? Colors.white
                                      : const Color.fromRGBO(30, 30, 30, 1),
                                  fontSize: w * .06,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Fun',
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected3 = !selected3;
                                  s3 = !s3;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                  _themeChanger.getAr()
                                      ? selected3
                                          ? FontAwesomeIcons.chevronLeft
                                          : FontAwesomeIcons.chevronDown
                                      : selected3
                                          ? FontAwesomeIcons.chevronRight
                                          : FontAwesomeIcons.chevronDown,
                                  color: _themeChanger.getchosen()
                                      ? Colors.grey
                                      : const Color.fromRGBO(58, 59, 1, 1),
                                  size: w * .06),
                              onPressed: () {
                                setState(() {
                                  selected3 = !selected3;
                                  s3 = !s3;
                                });
                              },
                            ),
                          ],
                        ),
                        Visibility(
                            visible: s3,
                            child: SizedBox(
                              height: h * .33,
                              width: w,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .6
                                        : w * .03,
                                    top: h * .007,
                                    child: Text("Leadership : ".tr(),
                                        style: TextStyle(
                                            fontSize: w * .05,
                                            color: _themeChanger.getchosen()
                                                ? Colors.grey[350]
                                                : const Color.fromRGBO(
                                                    30, 31, 90, 1),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .58
                                        : w * .03,
                                    top: h * .08,
                                    child: Text(
                                      "TeamWork : ".tr(),
                                      style: TextStyle(
                                          fontSize: w * .05,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : const Color.fromRGBO(
                                                  30, 31, 90, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .6
                                        : w * .03,
                                    top: h * .16,
                                    child: Text(
                                      "Adaptability : ".tr(),
                                      style: TextStyle(
                                          fontSize: w * .05,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : const Color.fromRGBO(
                                                  30, 31, 90, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .57
                                        : w * .03,
                                    top: h * .24,
                                    child: Text(
                                      "Critical\n     Thinking : ".tr(),
                                      style: TextStyle(
                                          fontSize: w * .05,
                                          color: _themeChanger.getchosen()
                                              ? Colors.grey[350]
                                              : const Color.fromRGBO(
                                                  30, 31, 90, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .0
                                        : w * .185,
                                    top: h * .25,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 70.0),
                                      child: RatingBar(
                                        ignoreGestures: true,
                                        itemPadding:
                                            const EdgeInsets.only(left: 1.0),
                                        initialRating: 4,
                                        minRating: 4,
                                        maxRating: 4,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: w * .065,
                                        ratingWidget: RatingWidget(
                                            full: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      205, 182, 157, 1)
                                                  : const Color.fromRGBO(
                                                      58, 67, 111, 1),
                                            ),
                                            half: const Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  96, 81, 184, 1),
                                            ),
                                            empty: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      120, 120, 120, 1)
                                                  : const Color.fromRGBO(
                                                      118, 124, 164, 1),
                                            )),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .0
                                        : w * .185,
                                    top: h * .16,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 70.0),
                                      child: RatingBar(
                                        ignoreGestures: true,
                                        itemPadding:
                                            const EdgeInsets.only(left: 1.0),
                                        initialRating: 4,
                                        minRating: 4,
                                        maxRating: 4,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: w * .065,
                                        ratingWidget: RatingWidget(
                                            full: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      205, 182, 157, 1)
                                                  : const Color.fromRGBO(
                                                      58, 67, 111, 1),
                                            ),
                                            half: const Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  96, 81, 184, 1),
                                            ),
                                            empty: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      120, 120, 120, 1)
                                                  : const Color.fromRGBO(
                                                      118, 124, 164, 1),
                                            )),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .0
                                        : w * .185,
                                    top: h * .086,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 70.0),
                                      child: RatingBar(
                                        ignoreGestures: true,
                                        itemPadding:
                                            const EdgeInsets.only(left: 1.0),
                                        initialRating: 4,
                                        minRating: 4,
                                        maxRating: 4,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: w * .065,
                                        ratingWidget: RatingWidget(
                                            full: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      205, 182, 157, 1)
                                                  : const Color.fromRGBO(
                                                      58, 67, 111, 1),
                                            ),
                                            half: const Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  96, 81, 184, 1),
                                            ),
                                            empty: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      120, 120, 120, 1)
                                                  : const Color.fromRGBO(
                                                      118, 124, 164, 1),
                                            )),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: _themeChanger.getAr()
                                        ? w * .0
                                        : w * .185,
                                    top: h * .0079,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 70.0),
                                      child: RatingBar(
                                        ignoreGestures: true,
                                        itemPadding:
                                            const EdgeInsets.only(left: 1.0),
                                        initialRating: 5,
                                        minRating: 5,
                                        maxRating: 5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: w * .065,
                                        ratingWidget: RatingWidget(
                                            full: Icon(
                                              Icons.circle,
                                              color: _themeChanger.getchosen()
                                                  ? const Color.fromRGBO(
                                                      205, 182, 157, 1)
                                                  : const Color.fromRGBO(
                                                      58, 67, 111, 1),
                                            ),
                                            half: const Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  96, 81, 184, 1),
                                            ),
                                            empty: const Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  118, 124, 164, 1),
                                            )),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Row(
                          children: [
                            InkWell(
                              child: Text(
                                "Languages".tr(),
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : const Color.fromRGBO(30, 30, 30, 1),
                                    fontSize: w * .06,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Fun'),
                              ),
                              onTap: () {
                                setState(() {
                                  selected4 = !selected4;
                                  s4 = !s4;
                                });
                              },
                            ),
                            IconButton(
                              padding: const EdgeInsets.only(top: 5),
                              icon: Icon(
                                  _themeChanger.getAr()
                                      ? selected4
                                          ? FontAwesomeIcons.chevronLeft
                                          : FontAwesomeIcons.chevronDown
                                      : selected4
                                          ? FontAwesomeIcons.chevronRight
                                          : FontAwesomeIcons.chevronDown,
                                  color: _themeChanger.getchosen()
                                      ? Colors.grey
                                      : const Color.fromRGBO(58, 59, 1, 1),
                                  size: w * .06),
                              onPressed: () {
                                setState(() {
                                  selected4 = !selected4;
                                  s4 = !s4;
                                });
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: s4,
                          child: SizedBox(
                            height: 330,
                            width: w,
                            child: Stack(children: [
                              Positioned(
                                left: _themeChanger.getAr() ? w * .59 : w * .03,
                                top: h * .007,
                                child: Text(
                                  "Kurdish : ".tr(),
                                  style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.grey[350]
                                        : const Color.fromRGBO(30, 31, 90, 1),
                                    fontSize: w * .05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: _themeChanger.getAr() ? w * .0 : w * .185,
                                top: h * .008,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: RatingBar(
                                    ignoreGestures: true,
                                    itemPadding:
                                        const EdgeInsets.only(left: 1.0),
                                    initialRating: 5,
                                    minRating: 5,
                                    maxRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: w * .065,
                                    ratingWidget: RatingWidget(
                                        full: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  205, 182, 157, 1)
                                              : const Color.fromRGBO(
                                                  58, 67, 111, 1),
                                        ),
                                        half: const Icon(
                                          Icons.circle,
                                          color: Color.fromRGBO(96, 81, 184, 1),
                                        ),
                                        empty: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  120, 120, 120, 1)
                                              : const Color.fromRGBO(
                                                  118, 124, 164, 1),
                                        )),
                                    onRatingUpdate: (double value) {},
                                  ),
                                ),
                              ),
                              Positioned(
                                left: _themeChanger.getAr() ? w * .57 : w * .03,
                                top: h * .08,
                                child: Text(
                                  "English : ".tr(),
                                  style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.grey[350]
                                        : const Color.fromRGBO(30, 31, 90, 1),
                                    fontSize: w * .05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: _themeChanger.getAr() ? w * .0 : w * .185,
                                top: h * .08,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: RatingBar(
                                    ignoreGestures: true,
                                    itemPadding:
                                        const EdgeInsets.only(left: 1.0),
                                    initialRating: 5,
                                    minRating: 5,
                                    maxRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: w * .065,
                                    ratingWidget: RatingWidget(
                                        full: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  205, 182, 157, 1)
                                              : const Color.fromRGBO(
                                                  58, 67, 111, 1),
                                        ),
                                        half: const Icon(
                                          Icons.circle,
                                          color: Color.fromRGBO(96, 81, 184, 1),
                                        ),
                                        empty: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  120, 120, 120, 1)
                                              : const Color.fromRGBO(
                                                  118, 124, 164, 1),
                                        )),
                                    onRatingUpdate: (double value) {},
                                  ),
                                ),
                              ),
                              Positioned(
                                left: _themeChanger.getAr() ? w * .59 : w * .03,
                                top: h * .16,
                                child: Text(
                                  "Arabic : ".tr(),
                                  style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.grey[350]
                                        : const Color.fromRGBO(30, 31, 90, 1),
                                    fontSize: w * .05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: _themeChanger.getAr() ? w * .0 : w * .185,
                                top: h * .16,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: RatingBar(
                                    ignoreGestures: true,
                                    itemPadding:
                                        const EdgeInsets.only(left: 1.0),
                                    initialRating: 3,
                                    minRating: 3,
                                    maxRating: 3,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: w * .065,
                                    ratingWidget: RatingWidget(
                                        full: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  205, 182, 157, 1)
                                              : const Color.fromRGBO(
                                                  58, 67, 111, 1),
                                        ),
                                        half: const Icon(
                                          Icons.circle,
                                          color: Color.fromRGBO(96, 81, 184, 1),
                                        ),
                                        empty: Icon(
                                          Icons.circle,
                                          color: _themeChanger.getchosen()
                                              ? const Color.fromRGBO(
                                                  120, 120, 120, 1)
                                              : const Color.fromRGBO(
                                                  118, 124, 164, 1),
                                        )),
                                    onRatingUpdate: (double value) {},
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
