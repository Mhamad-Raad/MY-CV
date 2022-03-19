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
import 'package:hasoi/today.dart';
import 'package:provider/provider.dart';
import 'aboutme.dart';
import 'e_s.dart';
import 'home.dart';

class Ec extends StatefulWidget {
  const Ec({Key? key}) : super(key: key);

  @override
  _EcState createState() => _EcState();
}

class _EcState extends State<Ec> {
  final ScrollController cj = ScrollController(initialScrollOffset: 50.0);
  @override
  void initState() {
    super.initState();
    if (cj.hasClients) cj.jumpTo(50.0);
  }

  String message = "";

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
              if (_themeChanger.getchosen() == true) {
                setState(() {
                  _themeChanger.setTheme(
                    ThemeData(
                        canvasColor: const Color(0xFF505050),
                        appBarTheme: const AppBarTheme(
                            backgroundColor: Color(0xFF424242),
                            foregroundColor: Colors.white),
                        iconTheme:
                            const IconThemeData(color: Colors.white, size: 40),
                        highlightColor:
                            const Color.fromRGBO(205, 202, 207, .3)),
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
                    highlightColor: const Color.fromRGBO(58, 67, 111, 1)));
              }
            });
          },
        ),
        centerTitle: true,
        title: Text(
          "Education & Certificates".tr(),
          style: TextStyle(
              fontFamily: 'Header',
              fontSize: w * .065,
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
                                  _themeChanger.setAr(false);
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
                              setState(() {
                                _themeChanger.setAr(true);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * .028,
              decoration: BoxDecoration(
                  color: _themeChanger.getchosen()
                      ? Colors.grey[900]
                      : const Color.fromRGBO(58, 67, 111, 1)),
            ),
            const SizedBox(height: 8),
            Container(
              width: w * .95,
              height: h * .17,
              decoration: BoxDecoration(
                color: _themeChanger.getchosen()
                    ? const Color(0xFF424242)
                    : const Color.fromRGBO(104, 114, 166, 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: w * .03, vertical: h * .015),
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),

                    leading: Icon(
                      Icons.circle,
                      size: w * .035,
                    ),
                    // leading: Container(
                    //   width: w * .025,
                    //   height: w * .025,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    // ),
                    title: Transform.translate(
                      offset: _themeChanger.getAr()
                          ? Offset(w * .1, -w * .015)
                          : Offset((w * .1) * -1, 0),
                      child: Container(
                        // alignment: Alignment(-1.2, 0),
                        margin: _themeChanger.getAr()
                            ? EdgeInsets.only(right: w * .015, top: h * .025)
                            : EdgeInsets.only(left: w * .015, top: w * .025),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "B.S.E., Software Engineering, ".tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .035),
                              ),
                              TextSpan(
                                text:
                                    "Qaiwan International Univeristy UTM Franchise, Sulaymaniyah, Iraq, 2023."
                                        .tr(),
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .035),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * .01),
            Container(
              height: h * .028,
              decoration: BoxDecoration(
                color: _themeChanger.getchosen()
                    ? Colors.grey[900]
                    : const Color.fromRGBO(58, 67, 111, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: w * .94,
              height: h * .2,
              decoration: BoxDecoration(
                color: _themeChanger.getchosen()
                    ? Colors.grey[800]
                    : const Color.fromRGBO(104, 114, 166, 1),
              ),
              alignment: Alignment.center,
              child: Container(
                width: w * .91,
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Scrollbar(
                  controller: cj,
                  radius: const Radius.circular(20),
                  thickness: w * .009,
                  isAlwaysShown: true,
                  child: ListView(
                    children: [
                      DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                              label: Text(
                            "Row".tr(),
                            style: TextStyle(
                                letterSpacing: .4,
                                color: _themeChanger.getchosen()
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: w * .036,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          )),
                          DataColumn(
                              label: Text(
                            "   Certificate".tr(),
                            style: TextStyle(
                                letterSpacing: .4,
                                color: _themeChanger.getchosen()
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: w * .036,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          )),
                          DataColumn(
                              label: Text(
                            "Location".tr(),
                            style: TextStyle(
                                letterSpacing: .4,
                                color: _themeChanger.getchosen()
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: w * .036,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              "1-",
                              style: TextStyle(
                                  color: _themeChanger.getchosen()
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: w * .036),
                            )),
                            DataCell(Container(
                                margin: const EdgeInsets.only(left: 22),
                                child: Text(
                                  "Future \nLeaders".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: w * .036),
                                ))),
                            DataCell(
                              Text(
                                "    AUIS".tr(),
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .036),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "2-",
                              style: TextStyle(
                                  color: _themeChanger.getchosen()
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: w * .036),
                            )),
                            DataCell(Container(
                                margin: const EdgeInsets.only(left: 22),
                                child: Text(
                                  "Microsoft".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: w * .036),
                                ))),
                            DataCell(
                              Text(
                                "     QIU",
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .036),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "3-",
                              style: TextStyle(
                                  color: _themeChanger.getchosen()
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: w * .036),
                            )),
                            DataCell(Container(
                                margin: const EdgeInsets.only(left: 22),
                                child: Text(
                                  "Marketing &\nManagement".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: w * .036),
                                ))),
                            DataCell(
                              Text(
                                "     KEA",
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .036),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "4 -",
                              style: TextStyle(
                                color: _themeChanger.getchosen()
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: w * .036,
                              ),
                            )),
                            DataCell(Container(
                                margin: const EdgeInsets.only(left: 22),
                                child: Text(
                                  "Microsoft".tr(),
                                  style: TextStyle(
                                      color: _themeChanger.getchosen()
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: w * .036),
                                ))),
                            DataCell(
                              Text(
                                "     QIU",
                                style: TextStyle(
                                    color: _themeChanger.getchosen()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: w * .036),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                  color: _themeChanger.getchosen()
                      ? Colors.grey[900]
                      : const Color.fromRGBO(58, 67, 111, 1)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: _themeChanger.getchosen()
                    ? Colors.grey[800]
                    : const Color.fromRGBO(104, 114, 166, 1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              child: DataTable(columns: [
                DataColumn(
                    label: Text("Shortcuts".tr(),
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.white
                                : Colors.black,
                            fontSize: w * .036,
                            fontStyle: FontStyle.italic))),
                DataColumn(
                    label: Text("Stands For".tr(),
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.white
                                : Colors.black,
                            fontSize: w * .036,
                            fontStyle: FontStyle.italic)))
              ], rows: [
                DataRow(cells: [
                  DataCell(
                    Text("    AUIS",
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.white
                                : Colors.black,
                            fontSize: w * .036)),
                  ),
                  DataCell(Text(
                      "American Univeristy of Iraq - Sulaymaniyah".tr(),
                      style: TextStyle(
                          color: _themeChanger.getchosen()
                              ? Colors.white
                              : Colors.black,
                          fontSize: w * .035)))
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("    QIU",
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.white
                                : Colors.black,
                            fontSize: w * .036)),
                  ),
                  DataCell(Text("Qaiwan Internation University".tr(),
                      style: TextStyle(
                          color: _themeChanger.getchosen()
                              ? Colors.white
                              : Colors.black,
                          fontSize: w * .036)))
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("    KEA",
                        style: TextStyle(
                            color: _themeChanger.getchosen()
                                ? Colors.white
                                : Colors.black,
                            fontSize: w * .036)),
                  ),
                  DataCell(Text("Kurdish & English Academy".tr(),
                      style: TextStyle(
                          color: _themeChanger.getchosen()
                              ? Colors.white
                              : Colors.black,
                          fontSize: w * .036)))
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }
}
