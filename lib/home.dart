import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:hasoi/aboutme.dart';
import 'package:hasoi/e_c.dart';
import 'package:hasoi/e_s.dart';
import 'package:hasoi/projects.dart';
import 'package:hasoi/theme.dart';
import 'package:hasoi/today.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: unused_import
import 'Lock.dart';

// ignore: must_be_immutable
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      saveLocale: true,
      path: 'assets/Languages',
      supportedLocales: const [Locale("en", "US"), Locale("ar", "IQ")],
      child: const L(),
    ),
  );
}

class DarkTheme extends StatefulWidget {
  const DarkTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: const mawiththeme(),
    );
  }
}

// ignore: camel_case_types
class mawiththeme extends StatelessWidget {
  const mawiththeme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Main(),
      theme: theme.getTheme(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    final formglobalkey = GlobalKey<FormState>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: formglobalkey,
      extendBodyBehindAppBar: true,

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
          "Home".tr(),
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
        height: h,
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
                height: h,
                color: _themeChanger.getchosen()
                    ? const Color(0xFF424242)
                    : const Color.fromRGBO(166, 177, 225, 1),
                child: Column(
                  children: [
                    ListTile(
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
                      },
                    ),
                    ListTile(
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
                    ListTile(
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
                    ListTile(
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
                    ListTile(
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
                    ListTile(
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
                    ListTile(
                      title: _themeChanger.getAr()
                          ? Text(
                              "English".tr(),
                              style: TextStyle(
                                  fontSize: w * .07,
                                  fontFamily: "Header",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "Arabic".tr(),
                              style: TextStyle(
                                  fontSize: w * .07,
                                  fontFamily: "Header",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                      onTap: () {
                        if (_themeChanger.getAr()) {
                          setState(() {
                            _themeChanger.setAr(false);
                            EasyLocalization.of(context)!
                                .setLocale(const Locale("en", "US"));
                          });
                        } else {
                          setState(() {
                            _themeChanger.setAr(true);
                            EasyLocalization.of(context)!
                                .setLocale(const Locale("ar", "IQ"));
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /////////////////////////////////////////////////////
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: h * .337,
            child: Text("Full Stack Developer".tr(),
                style: TextStyle(
                    fontFamily: "Name",
                    fontSize: w * .055,
                    fontWeight: FontWeight.w900,
                    color: _themeChanger.getchosen()
                        ? const Color.fromRGBO(240, 227, 227, .5)
                        : const Color.fromRGBO(0, 0, 0, .37))),
          ),
          Positioned(
            bottom: h * .29,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url =
                        "https://www.facebook.com/profile.php?id=100070836252008";
                    await launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(58, 67, 111, 1),
                      size: w * .058,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = "https://wa.me/9647701844913";
                    await launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(58, 67, 111, 1),
                      size: w * .058,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = "https://www.instagram.com/hamaraad01/";
                    await launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(58, 67, 111, 1),
                      size: w * .058,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url =
                        "https://www.snapchat.com/add/kaka_m3amad?share_id=MTY5RDk4&locale=en_IQ";
                    await launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.snapchatGhost,
                      color: _themeChanger.getchosen()
                          ? const Color.fromRGBO(240, 227, 227, 1)
                          : const Color.fromRGBO(58, 67, 111, 1),
                      size: w * .058,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h * 0.25,
                  width: w,
                  decoration: BoxDecoration(
                    color: _themeChanger.getchosen()
                        ? const Color(0xFF424242)
                        : const Color.fromRGBO(141, 152, 206, 1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: h * .07,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'View My Website'.tr(),
                  style: TextStyle(
                      color: _themeChanger.getchosen()
                          ? Colors.grey[900]
                          : Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: w * .05),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  shadowColor: const Color.fromRGBO(0, 0, 0, .5),
                  primary: _themeChanger.getchosen()
                      ? const Color.fromRGBO(240, 227, 227, 1)
                      : const Color.fromRGBO(104, 114, 166, 1),
                  fixedSize: Size(w * .85, h * .1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: h * .03,
              right: w * .15,
              child: Icon(
                _themeChanger.getchosen()
                    ? FontAwesomeIcons.cloudMoon
                    : FontAwesomeIcons.cloudSun,
                color: _themeChanger.getchosen()
                    ? const Color.fromRGBO(240, 227, 227, 1)
                    : Colors.white,
                size: w * .14,
              )),
          Positioned(
              top: h * .12,
              left: w * .05,
              child: Icon(
                Icons.cloud,
                color: _themeChanger.getchosen()
                    ? const Color.fromRGBO(240, 227, 227, 1)
                    : Colors.white,
                size: w * .135,
              )),
          Positioned(
            bottom: h * .37,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text("Mhamad Raad Radha".tr(),
                        style: TextStyle(
                          fontFamily: "Name",
                          fontSize: h * .05,
                          fontWeight: FontWeight.bold,
                          color: _themeChanger.getchosen()
                              ? const Color.fromRGBO(240, 227, 227, 1)
                              : Colors.black,
                        ))),
              ],
            ),
          ),
          Positioned(
            top: h * .11,
            child: Row(
              children: [
                Container(
                  height: h * .28,
                  width: w * .6,
                  padding: const EdgeInsets.all(40),
                  child: const Image(
                    image: AssetImage('assets/images/Batman-Logo.png'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _themeChanger.getchosen()
                        ? const Color.fromRGBO(240, 227, 227, 1)
                        : const Color.fromRGBO(141, 152, 206, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
