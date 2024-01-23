import 'package:devloperproject1/Register.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
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
   double _sigmaX = 5; // from 0-10
   double _sigmaY = 5; // from 0-10
   double _opacity = 0.2;
   double _width = 350;
   double _height = 300;
   final _formKey = GlobalKey<FormState>();

   // sign user in method
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/image/login.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.26),
                  const Text("Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                      ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding:EdgeInsets.symmetric(horizontal: 10.0),

                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [TextField(style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                decoration: (InputDecoration(labelText: "Log in",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                  hintText: "Email id",)
                                ),
                              ),
                                Padding(padding: EdgeInsets.all(20)),
                                TextField(style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: (InputDecoration(labelText: "password",
                                      labelStyle: TextStyle(color: Colors.white),focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black
                                      )
                                  ),enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.black)
                                  ),
                                    hintText: "password",)),
                                  obscureText: true,
                                ),
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
                                  height: 5.0,
                                ),

                                SizedBox(height: 30),
                                ElevatedButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ufirstpage(),));
                                }, child: Text("Sign in",style: TextStyle(color: Colors.white,),),
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                                    }, child: Text("Sign up"),
                                    ),
                                  ],
                                ))
                              ]
                            ),
                          ),
                        ),
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
 }