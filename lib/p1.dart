import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool chosen = true;
var rand = Random();
String id = "69jokwidyouson21";

// ignore: camel_case_types
class p1 extends StatefulWidget {
  const p1({Key? key}) : super(key: key);

  @override
  _p1State createState() => _p1State();
}

// ignore: camel_case_types
class _p1State extends State<p1> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: h * .6,
                        width: w,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(48, 87, 161, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60)),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: w * .35),
                          child: Column(
                            children: [
                              Container(
                                height: w * .03,
                              ),
                              Container(
                                height: h * .06,
                                width: w * .7,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, .3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Balance:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * .06,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${rand.nextInt(10000)} \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * .06,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Account Detials: $id",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: w * .035,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, .5),
                                ),
                              ),
                              SizedBox(
                                height: h * .06,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "AVG Spending",
                                    style: TextStyle(
                                        fontSize: w * .04,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    "AVG Deposite",
                                    style: TextStyle(
                                        fontSize: w * .04,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.023,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // ignore: prefer_const_constructors
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "12",
                                            style:
                                                TextStyle(fontSize: h * .04)),
                                        TextSpan(
                                            text: " \$",
                                            style:
                                                TextStyle(fontSize: h * .02)),
                                        TextSpan(
                                            text: "/day",
                                            style: TextStyle(fontSize: h * .02))
                                      ],
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "     100",
                                        style: TextStyle(fontSize: h * .04)),
                                    TextSpan(
                                        text: " \$",
                                        style: TextStyle(fontSize: h * .02)),
                                    TextSpan(
                                        text: "/week",
                                        style: TextStyle(fontSize: h * .02))
                                  ])),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: h * .54),
                      width: w * .9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PhysicalModel(
                            color: Colors.white,
                            elevation: 8,
                            shadowColor: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              height: h * .11,
                              width: w * .25,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.wallet,
                                    size: w * .08,
                                    color: Colors.blueGrey,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color.fromRGBO(0, 0, 0, .3)),
                                    width: w * .15,
                                    height: 2,
                                  ),
                                  Text(
                                    "Deposite",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * .043),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PhysicalModel(
                            color: Colors.white,
                            elevation: 8,
                            shadowColor: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              height: h * .11,
                              width: w * .25,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Icon(
                                        FontAwesomeIcons.moneyBillWave,
                                        size: w * .08,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Color.fromRGBO(0, 0, 0, .3)),
                                      width: w * .15,
                                      height: 2,
                                    ),
                                    Text(
                                      "Withdraw",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * .043),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          PhysicalModel(
                            color: Colors.white,
                            elevation: 8,
                            shadowColor: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              height: h * .11,
                              width: w * .25,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.sortAmountUp,
                                    size: w * .08,
                                    color: Colors.blueGrey,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color.fromRGBO(0, 0, 0, .3)),
                                    width: w * .15,
                                    height: 2,
                                  ),
                                  Text(
                                    "Plans",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * .043),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * .7),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "  My Goals",
                            style: TextStyle(
                              fontSize: w * .06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: w * .9,
                          height: h * .15,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.commonwealthfund.org/sites/default/files/styles/countries_hero_desktop/public/country_image_Canada.jpg?h=f2fcf546&itok=HpXJ6X1n"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * .07),
                            child: Text(
                              "Canada Trip",
                              style: TextStyle(
                                  fontSize: w * .05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * .07),
                            child: Text(
                              "  Let's save for a family trip 2019",
                              style: TextStyle(
                                  fontSize: w * .03,
                                  fontWeight: FontWeight.w900,
                                  color: const Color.fromRGBO(0, 0, 0, .5)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * .05,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.amber,
                          ),
                          height: h * .05,
                          width: w * .7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "10, 000, 000 IQD",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: w * .05,
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: w * .21),
                      child: Text(
                        " My Savings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: w * .05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: w * .195, left: w * .03),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: w * .07,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
