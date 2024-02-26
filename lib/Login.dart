import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:devloperproject1/Optionbutton.dart';
import 'package:devloperproject1/Register.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginstate();
  }
  }
 class Loginstate extends State<Loginpage>{

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   final formKey = new GlobalKey<FormState>();
   var logindata;
   var data;
   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/image/login1.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                      height: 300),
                  FadeInDown(duration: Duration(milliseconds: 1000),
                      child:
                   Text("Log in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),),

                  SizedBox(
                      height: 15),

                  Container(margin: EdgeInsets.all(10),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(elevation: 20.0,
                                  shadowColor: Colors.green,

                                child:
                                TextFormField(controller: emailController,
                                  validator: (val) {
    if (val!.isEmpty ||
    RegExp(r"\s").hasMatch(val)) {
    return "Email must not be empty";
    }},
    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                decoration: (InputDecoration(labelText: "Log in",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.green)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green
                                    )
                                ),
                                  hintText: "Email id",)
                                ),),
                              ),
                                Padding(padding: EdgeInsets.all(10)),
                                Material(
                                  elevation: 20,
                                  shadowColor: Colors.green,
                                child: TextFormField(controller: passwordController,
                                  validator:  (val) {
                                    if (val!.isEmpty ||
                                        RegExp(r"\s").hasMatch(val)) {
                                      return "Use Proper Password ";
                                    }
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: (InputDecoration(labelText: "password",
                                      labelStyle: TextStyle(color: Colors.black),focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green
                                      )
                                  ),enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.green)
                                  ),
                                    hintText: "password",)),
                                  obscureText: true,
                                ),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),


                                  child: Row(children: [
                                    SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                    )
                                  ]),
                                ),
                                SizedBox(
                                  height: 0,
                                ),

                                SizedBox(height: 30),
                                ElevatedButton(onPressed: _submit,
                                  child: Text("Sign in",style: TextStyle(color: Colors.white,),),
                                  style: ElevatedButton.styleFrom(primary: ColorConstants.buttonscolor),
                                    ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(padding: EdgeInsets.only(left: 0,right: 0),
                                    child:
                                Row(
                                  children: [ Text("Don't have an account?"),
                                    TextButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => option(),));
                                    },
                                      child: Text("Sign up"),
                                    ),
                                  ],
                                ))
                              ]
                            ),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
   // @override
   // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
   //   super.debugFillProperties(properties);
   //   properties.add(StringProperty('SelectedRole', SelectedRole));
   // }

   Future<void> _submit() async {
     final form = formKey.currentState;
     if (form!.validate()) {
       setState(() {
         isLoading = true;
       });
       final login_url = Uri.parse(
           "https://e-healthhub.000webhostapp.com/API/login.php");
       final response = await http
           .post(login_url, body: {
         "EMAIL_ID": emailController.text,
         "PASSWORD": passwordController.text
       });
       if (response.statusCode == 200) {
         logindata = jsonDecode(response.body);
         data =
         jsonDecode(response.body)['user'];
         print(data);
         setState(() {
           isLoading = false;
         });
         if (logindata['error'] == false) {
           SharedPreferences setpreference = await SharedPreferences.getInstance();
           setpreference.setString('id', data['USER_Id'].toString());
           setpreference.setString('name', data['U_NAME'].toString());

           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Ufirstpage()), (Route<dynamic> route) => false);
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
