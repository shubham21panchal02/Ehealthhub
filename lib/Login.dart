import 'package:animate_do/animate_do.dart';
import 'package:devloperproject1/Register.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginstate();
  }
  }
 class Loginstate extends State<Loginpage>{
   List<String> Role = ['Admin', 'User', 'Hospital']; // Option 2
   late String SelectedRole;

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
                                TextField(style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
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
                                child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
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
                                ElevatedButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ufirstpage(),));
                                },
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage(),));
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
   @override
   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
     super.debugFillProperties(properties);
     properties.add(StringProperty('SelectedRole', SelectedRole));
   }
 }