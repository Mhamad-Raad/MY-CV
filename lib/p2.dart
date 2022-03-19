import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class p2 extends StatefulWidget {
  const p2({Key? key}) : super(key: key);

  @override
  _p2State createState() => _p2State();
}

// ignore: camel_case_types
class _p2State extends State<p2> {
  final index = 2;
  final item = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.text_fields,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.search,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.settings,
      size: 30,
      color: Colors.white,
    )
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: h * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: w * .07,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello There,\n',
                            style: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, .3),
                                fontWeight: FontWeight.bold,
                                fontSize: w * .045),
                          ),
                          TextSpan(
                            text: 'Welcome Back!',
                            style: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: w * .06),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, top: 5),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
          SizedBox(
            height: h * .02,
          ),
          SizedBox(
            width: w,
            height: h * .17,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w * .03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.08,
                        width: w * .15,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1075776648363028480/_IlPbvr0_400x400.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Text("Friend 1",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.08,
                        width: w * .16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.pioneeringminds.com/wp-content/uploads/2018/10/Steve-Jobs.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Text("Friend 2",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.08,
                        width: w * .16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://lixpressny.com/wp-content/uploads/2019/02/person2.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Text("Friend 3",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.08,
                        width: w * .16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://media.vanityfair.com/photos/5aaaa8d14807db55e0503de5/2:3/w_887,h_1331,c_limit/Stephen-Hawking.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Text("Friend 4",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.08,
                        width: w * .16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.digitaldeclaration.com/img/uploads/image_190430_145029.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Text("Friend 5",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: w * .02, top: w * .05),
              child: Text("popular Games",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * .055)),
            ),
          ),
          SizedBox(
            height: h * .03,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: w * 0.04,
                ),
                Container(
                  height: h * .15,
                  width: w * .4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.blueGrey,
                  ),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                          width: w,
                          height: h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://statics.igg.com/sites/igg/www/game/2021/07/22/053518_60f949e6c1bac8371_min.jpg"),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.07,
                ),
                Container(
                  height: h * .15,
                  width: w * .4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.blueGrey,
                  ),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                          width: w,
                          height: h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://www.insidehook.com/wp-content/uploads/2020/10/among-us.jpg?fit=1500%2C1000"),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.07,
                ),
                Container(
                  height: h * .15,
                  width: w * .4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.blueGrey,
                  ),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                          width: w,
                          height: h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://media.contentapi.ea.com/content/dam/battlefield/battlefield-2042/images/2021/04/k-1920x1080-featured-image.jpg.adapt.crop191x100.1200w.jpg"),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.07,
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * .03,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: w * .02),
              child: Text(
                "Recomended Games",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: w * .055,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: w * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://image.api.playstation.com/vulcan/img/rnd/202010/2217/LsaRVLF2IU2L1FNtu9d3MKLq.jpg"),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://cdn.shopify.com/s/files/1/0265/9755/6317/products/sony-gaming-assassin-s-creed-valhalla-drakkar-editon-ps4-21779351371944.jpg?v=1614001949"),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: w * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://i.ytimg.com/vi/J1LuNNkw9jo/maxresdefault.jpg"),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://lunasmods.com/wp-content/uploads/2018/01/black-ops-2.jpg"),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * .03,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.grey[900],
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        height: h * 0.075,
        index: index,
        items: item,
        onTap: (index) {},
      ),
    );
  }
}
