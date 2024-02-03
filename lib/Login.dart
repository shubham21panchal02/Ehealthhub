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
                'assets/image/login2.jpg',
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
                  SizedBox(height:20),
                  Container(margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(decoration: InputDecoration(labelText: "Email id",prefixIconColor:Color(0xFF0e9096)
                          ,labelStyle: TextStyle(color: Colors.white),hintText: "abc@gmail.com",focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white)
                        ),enabledBorder: OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white,)
                        ),),),
                        SizedBox(height: 20,),
                        TextField(decoration: InputDecoration(labelText: "Password",prefixIconColor:Color(0xFF0e9096)
                          ,labelStyle: TextStyle(color: Colors.white),hintText: "password",focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white)
                          ),enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.white,)
                          ),),),
                      ],
                    ),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
 }