// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore
// ignore: avoid_web_libraries_in_flutter, unused_import
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'contactMe.dart';
import 'request_password.dart';
import 'package:hasoi/home.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// ignore: unused_import
// ignore: non_constant_identifier_names
class L extends StatelessWidget {
  const L({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lock(),
    );
  }
}

class Lock extends StatelessWidget {
  const Lock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    Widget example1 = SplashScreenView(
        navigateRoute: const Lock1(),
        duration: 5000,
        imageSize: 150,
        imageSrc: "assets/images/LS2.png",
        text: "Welcome to my App",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: w * .1,
        ),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: const Color.fromRGBO(141, 152, 206, 1));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lock',
      home: example1,
    );
  }
}

class Lock1 extends StatefulWidget {
  const Lock1({Key? key}) : super(key: key);

  @override
  _lockState createState() => _lockState();
}

// ignore: camel_case_types
class _lockState extends State<Lock1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(166, 177, 225, 1),
                Color.fromRGBO(141, 152, 206, 1)
              ], begin: Alignment.topRight),
            ),
            child: const OtpScreen(),
          ),
        ));
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreen createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  int Try = 0;
  CollectionReference users = FirebaseFirestore.instance.collection('password');
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinoneController = TextEditingController();
  TextEditingController pintwoController = TextEditingController();
  TextEditingController pinthreeController = TextEditingController();
  TextEditingController pinfourController = TextEditingController();

  var outlineinputborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  int pinIndex = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc("37yIxwhNxznQgn72ckeJ").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong, please try again later");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            const Text("Servers down at the moment please try again later");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: SizedBox(
                width: w,
                height: h,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: const Alignment(0, 0.5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              BuildSecurityText(w),
                              SizedBox(
                                height: h * .03,
                              ),
                              buildpinRow(),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: buildNumberPad(data, w, h),
                      ),
                      SizedBox(
                        height: h * .07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              width: w * .4,
                              height: h * .06,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(58, 67, 111, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Request Password",
                                  style: TextStyle(
                                    fontSize: w * .04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Request(),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              width: w * .4,
                              height: h * .06,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(58, 67, 111, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                "Contact Me",
                                style: TextStyle(
                                  fontSize: w * .04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Contact()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * .1,
                        width: w,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SpinKitHourGlass(
            color: Colors.black,
          );
        });
  }

  buildNumberPad(data, w, h) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              KeyboardNumber(
                n: 1,
                onPressed: () {
                  pindexsetup('1', data);
                },
              ),
              KeyboardNumber(
                n: 2,
                onPressed: () {
                  pindexsetup('2', data);
                },
              ),
              KeyboardNumber(
                n: 3,
                onPressed: () {
                  pindexsetup('3', data);
                },
              ),
            ],
          ),
          SizedBox(
            height: h * .009,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              KeyboardNumber(
                n: 4,
                onPressed: () {
                  pindexsetup('4', data);
                },
              ),
              KeyboardNumber(
                n: 5,
                onPressed: () {
                  pindexsetup('5', data);
                },
              ),
              KeyboardNumber(
                n: 6,
                onPressed: () {
                  pindexsetup('6', data);
                },
              ),
            ],
          ),
          SizedBox(
            height: h * .01,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  n: 7,
                  onPressed: () {
                    pindexsetup('7', data);
                  },
                ),
                KeyboardNumber(
                  n: 8,
                  onPressed: () {
                    pindexsetup('8', data);
                  },
                ),
                KeyboardNumber(
                  n: 9,
                  onPressed: () {
                    pindexsetup('9', data);
                  },
                ),
              ]),
          SizedBox(
            height: h * .009,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: w * .163,
                height: h * .085,
                decoration: const BoxDecoration(
                  // color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const MaterialButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
              ),
              KeyboardNumber(
                  n: 0,
                  onPressed: () {
                    pindexsetup('0', data);
                  }),
              SizedBox(
                width: w * .15,
                child: MaterialButton(
                  onPressed: () {
                    clearpin();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * .05)),
                  child: const Icon(
                    FontAwesomeIcons.backspace,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  clearpin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pindexsetup(String text, data) async {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strpin = "";
    // ignore: avoid_function_literals_in_foreach_calls
    currentPin.forEach((e) {
      strpin += e;
    });

    if (pinIndex == 4) {
      // ignore: avoid_print
      print(strpin);
      if (int.tryParse(strpin) == data["pass"]) {
        Try = 0;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DarkTheme()));
      } else if (int.tryParse(strpin) != data["pass"]) {
        Vibration.vibrate(duration: 500);
        pinoneController.text = "";
        pintwoController.text = "";
        pinthreeController.text = "";
        pinfourController.text = "";
        pinIndex = 0;

        if (Try == 5) {
          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              message: "Please request the password before you try again",
            ),
          );
        }
        Try++;
      }
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinoneController.text = text;
        break;
      case 2:
        pintwoController.text = text;
        break;
      case 3:
        pinthreeController.text = text;
        break;
      case 4:
        pinfourController.text = text;
        break;
    }
  }

  buildpinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          textEditingController: pinoneController,
          outlineInputBorder: outlineinputborder,
        ),
        PINNumber(
          textEditingController: pintwoController,
          outlineInputBorder: outlineinputborder,
        ),
        PINNumber(
          textEditingController: pinthreeController,
          outlineInputBorder: outlineinputborder,
        ),
        PINNumber(
          textEditingController: pinfourController,
          outlineInputBorder: outlineinputborder,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  BuildSecurityText(w) {
    return Text(
      "Security PIN",
      style: TextStyle(
          color: const Color.fromRGBO(58, 67, 111, 1),
          fontSize: w * .09,
          fontWeight: FontWeight.bold),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50,
            minWidth: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.clear,
              color: Color.fromRGBO(58, 67, 111, 1),
            ),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class PINNumber extends StatelessWidget {
  TextEditingController textEditingController;
  PINNumber(
      {Key? key,
      required this.textEditingController,
      required this.outlineInputBorder})
      : super(key: key);
  OutlineInputBorder outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * .15,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(w * .03),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white30),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: w * .07,
            color: const Color.fromRGBO(58, 67, 111, 1)),
      ),
    );
  }
}

// ignore: must_be_immutable
class KeyboardNumber extends StatelessWidget {
  int n;
  final Function() onPressed;
  KeyboardNumber({Key? key, required this.n, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * .25,
      height: h * .095,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(100, 100, 150, 1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        // padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        height: h * .08,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: w * .08,
              color: Colors.white70,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
