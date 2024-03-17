import 'dart:async';
import 'package:devloperproject1/Admin/Afristpage.dart';
import 'package:devloperproject1/Hospital/Hfirstpage.dart';
import 'package:devloperproject1/Login.dart';
import 'package:devloperproject1/Slider.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:devloperproject1/Slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      if(prefs.getString('id') != null) {
        if(prefs.getString('role') != null && prefs.getString('role') == "0"){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Afristpage()), (Route<dynamic> route) => false);
        }else if(prefs.getString('role') != null && prefs.getString('role') == "2"){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => h_firstpage()), (Route<dynamic> route) => false);
        }else {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Ufirstpage()), (Route<dynamic> route) => false);
        }
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => Loginpage()), (
            Route<dynamic> route) => false);
      }
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (BuildContext context) => SliderScreen()), (
          Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(24),
              child:Lottie.asset('assets/image/animation.json',alignment:Alignment.center) ,),
            Text('E-HealthHub',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
