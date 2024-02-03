import 'package:devloperproject1/Login.dart';
import 'package:devloperproject1/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);
  @override
  State<SliderScreen> createState() => _SliderState();
}

class _SliderState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(onFinish: (){
      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) =>Loginpage()));
    },
      finishButtonText: 'Log in',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Color(0xFF0e9096),
      ),


      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF0e9096),
          fontWeight: FontWeight.w600,
        ),
      ),

      controllerColor: Color(0xFF0e9096),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      centerBackground: true,
      imageHorizontalOffset: 16,
      imageVerticalOffset: 16,
      background: [
        Image.asset(
          "assets/image/Firstpage.jpg",
          height: 350,width: 350,
        ),
        Image.asset(
          "assets/image/Secondpage.jpg",
          height: 400,
        ),
        Image.asset(
          'assets/image/Thirdpage.jpg',
          height: 400,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                "Get Follow up for your appointment",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Manage appointment with your hospital, and get accurate information",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                "Book the best hospital arround you",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'More than 500+ specialist doctor are ready to serve you',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                "Connect With your doctor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Consult your problem your problem with doctors and easy to connected for your better treatment",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
