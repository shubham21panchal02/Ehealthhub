import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';

class Registerpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Registerstate();
  }
}
class Registerstate extends State<Registerpage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.grey.shade900,
                  Colors.greenAccent.shade100,
                  Colors.black,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Welcome User", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          FadeInUp(duration: Duration(milliseconds: 1400), child: Container(

                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),


                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1
                                      )
                                  ),
                                  child: TextFormField(controller: userNameController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Use Proper name";
                                      }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: "Enter your name",
                                        suffixIcon: Icon(Icons.account_box,color: Colors.greenAccent.shade100,),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1
                                      )
                                  ),
                                  child: TextFormField(controller: ageController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Use Proper age ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: "Age",
                                        suffixIcon: Icon(Icons.calendar_month,color: Colors.greenAccent.shade100,),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1
                                      )
                                  ),

                                  child: TextFormField(controller: genderController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Use Proper gender";
                                      }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.person,color: Colors.greenAccent.shade100,),
                                        hintText: "Gender",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          SizedBox(
                            height: 7,
                          ),
                          Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )
                            ),
                            child: TextFormField(controller: bloodgroupController,
                              validator:  (val) {
                                if (val!.isEmpty ||
                                    RegExp(r"\s").hasMatch(val)) {
                                  return "Use Proper Password ";
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.bloodtype,color: Colors.greenAccent.shade100,),
                                  hintText: "Blood group",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )
                            ),
                            child: TextFormField(controller: emailController,
                              validator:  (val) {
                                if (val!.isEmpty ||
                                    RegExp(r"\s").hasMatch(val)) {
                                  return "Use Proper Email id";
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email,color: Colors.greenAccent.shade100,),
                                  hintText: "Email id",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )
                            ),
                            child: TextFormField(controller: passwordController,
                              validator:  (val) {
                                if (val!.isEmpty ||
                                    RegExp(r"\s").hasMatch(val)) {
                                  return "Use Proper Password ";
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye,color: Colors.greenAccent.shade100,),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                          SizedBox(height: 40,),
                          FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                            onPressed:_submit,
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.greenAccent.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),

                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: Center(
                              child: Text("Login",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
}

Future<void> _submit() async {
  final form = _formKey.currentState;
  if (form!.validate()) {
    setState(() {
      isLoading = true;
    });
    final login_url = Uri.parse(
        "https://e-healthhub.000webhostapp.com/API/register.php");

    final response = await http
        .post(login_url, body: {
      "EMAIL_ID": emailController.text,
      "PASSWORD": passwordController.text,
      "U_NAME": userNameController.text,
      "AGE": ageController.text,
      "GENDER": genderController.text,
      "BLOOD_GROUP": bloodgroupController.text,
      "ADDRESS": addressController.text,
    "Role": "1",

    });
    if (response.statusCode == 200) {
      print("object");
      logindata = jsonDecode(response.body);
      data =
      jsonDecode(response.body)['user'];
      print(logindata);
      setState(() {
        isLoading = false;
      });
      if (logindata['error'] == false) {
        Fluttertoast.showToast(
            msg: logindata['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loginpage()),
                (route) => false);
      }else{
        Fluttertoast.showToast(
            msg: logindata['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
      }
    }
  }
}
}