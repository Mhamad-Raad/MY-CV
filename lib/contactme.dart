// ignore_for_file: nullable_type_in_catch_clause, curly_braces_in_flow_control_structures, avoid_print, file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final formGlobalKey = GlobalKey<FormState>();

// ignore: must_be_immutable
class Contact extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController massage = TextEditingController();
  TextEditingController name = TextEditingController();
  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(141, 152, 206, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h * .05),
            Row(
              children: [
                SizedBox(
                  width: w * .02,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: w * .07,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: w * .25),
                  child: Text(
                    "Contact Me",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: w * .06,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * .018,
            ),
            Container(
              width: w,
              height: 1,
              color: Colors.black.withOpacity(.7),
            ),
            SizedBox(
              height: h * .01,
            ),
            Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  SizedBox(
                    height: h * .05,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: w * .08,
                    ),
                    title: TextFormField(
                      controller: name,
                      validator: (name) {
                        if (name != "" && isNameValid(name!))
                          return null;
                        else
                          return 'Enter a valid name';
                      },
                      decoration: const InputDecoration(
                        hintText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.pen,
                      color: Colors.black,
                      size: w * .08,
                    ),
                    title: TextFormField(
                      controller: subject,
                      validator: (subject) {
                        if (subject != "")
                          return null;
                        else
                          return 'Enter a valid Subject name';
                      },
                      decoration: const InputDecoration(
                        hintText: "Subject",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: w * .08,
                    ),
                    title: TextFormField(
                      controller: email,
                      validator: (email) {
                        if (email != "" && isEmailValid(email!))
                          return null;
                        else
                          return 'Enter a valid email address';
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  Container(
                    width: w * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: massage,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Massage",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(.5), width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(101, 102, 150, 1),
                      ),
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          sendEmail(
                              name: name.text,
                              email: email.text,
                              massage: massage.text,
                              subject: subject.text);
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message:
                                  "Your request has been sent successfully, please wait untle you get a reply <3",
                            ),
                          );
                          massage.text = "";
                          name.text = "";
                          email.text = "";
                        }
                      },
                      child: Text(
                        "Send Massage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: w * .05),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future sendEmail(
      {required String name,
      required String email,
      required String massage,
      required String subject}) async {
    var serviceId = "service_ezcoaj8";
    var templateId = "template_yt1taaf";
    var userId = "user_HuKpwTBqfsVm40phvlXmn";
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // ignore: unused_local_variable
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_massage': massage,
        }
      }),
    );
  }

  bool isEmailValid(String email) => email.contains("@") && email.length >= 6;
  bool isNameValid(String name) =>
      name.length >= 4 &&
      !name.contains("0") &&
      !name.contains("1") &&
      !name.contains("2") &&
      !name.contains("3") &&
      !name.contains("4") &&
      !name.contains("5") &&
      !name.contains("6") &&
      !name.contains("7") &&
      !name.contains("8") &&
      !name.contains("9") &&
      !name.contains("&") &&
      !name.contains("(") &&
      !name.contains(")") &&
      !name.contains("-") &&
      !name.contains("_") &&
      !name.contains("+") &&
      !name.contains("*") &&
      !name.contains("@") &&
      !name.contains("!") &&
      !name.contains("?") &&
      !name.contains("/") &&
      !name.contains("\\") &&
      !name.contains("|") &&
      !name.contains("{") &&
      !name.contains("}") &&
      !name.contains("=") &&
      !name.contains("+") &&
      !name.contains("[") &&
      !name.contains("]") &&
      !name.contains("`") &&
      !name.contains("~") &&
      !name.contains("^") &&
      !name.contains("%") &&
      !name.contains("\$") &&
      !name.contains(",") &&
      !name.contains(".") &&
      !name.contains("<") &&
      !name.contains(">") &&
      !name.contains(":") &&
      !name.contains(";") &&
      !name.contains("\"") &&
      !name.contains("'");
}
