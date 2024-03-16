import 'dart:convert';

import 'package:devloperproject1/Admin/Afeedback.dart';
import 'package:devloperproject1/Admin/Ahospital.dart';
import 'package:devloperproject1/Admin/Ausers.dart';
import 'package:devloperproject1/Login.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:lottie/lottie.dart';

class Afristpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Afristpagestate();
  }
}
class Afristpagestate extends State<Afristpage>{
  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AdvancedDrawer(
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 24.0,
                    ),
                   child:
                   CircleAvatar(child:
                   Image.asset('assets/image/admin2.png',fit: BoxFit.fill,
                     alignment: Alignment.center,),backgroundColor: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name:"+ " admin",style:TextStyle(fontSize: 20,color: Colors.white,)),
                      SizedBox(height: 20,),
                      Text("Email:"+ " admin2024@gmail.com",style:TextStyle(fontSize: 20,color: Colors.white)),
                    ],
                  ),

                  Divider(height: 100, color: Colors.black),

                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Ahospital(),));
                    },
                    leading: Icon(Icons.local_hospital),
                    title: Text('Manage Hospital'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Ausers(),));
                    },
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text('Manage User'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Afeedback(),));
                    },
                    leading: Icon(Icons.feedback_outlined),
                    title: Text('Manage Feedback'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),),
          ),
        ),
        backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ColorConstants.drawercolor, Color(0xFF9dcdd1).withOpacity(0.2)],
    ),
    ),
    ),
    controller: _advancedDrawerController,
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    // openScale: 1.0,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
    // NOTICE: Uncomment if you want to add shadow behind the page.
    // Keep in mind that it may cause animation jerks.
    // boxShadow: <BoxShadow>[
    //   BoxShadow(
    //     color: Colors.black12,
    //     blurRadius: 0.0,
    //   ),
    // ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),child:Scaffold(
      appBar: AppBar(title:Text("Admin"), leading: IconButton(
        onPressed: _handleMenuButtonPressed,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: _advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: Icon(
                value.visible ? Icons.clear : Icons.menu,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      ),backgroundColor: ColorConstants.appbarcolor,actions: [

      ],),

      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) =>Ahospital() ,));
            },
              child: Card(margin: EdgeInsets.all(10),elevation: 10,
                // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // Set the clip behavior of the card
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // Define the child widgets of the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Center(child:Lottie.asset('assets/image/hospital.json',width: double.infinity ,height: 200) ,),
                    // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels

                    // Add a container with padding that contains the card's title, text, and buttons
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Display the card's title using a font size of 24 and a dark grey color
                         Center(child:  Text(
                            "Hospital",
                            style: TextStyle(
                              fontSize: 24,fontWeight: FontWeight.bold,
                              color:ColorConstants.appbarcolor,
                            ),
                          ),)
                          // Add a space between the title and the text
                          // Display the card's text using a font size of 15 and a light grey colo
                          // Add a row with two buttons spaced apart and aligned to the right side of the card
                        ],
                      ),
                    ),
                    // Add a small space between the card and the next widge
                  ],
                ),
              ),
            ),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:   (context) => Ausers(),));},
              child: Card(margin: EdgeInsets.all(10),elevation: 10,
                // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // Set the clip behavior of the card
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // Define the child widgets of the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                Center(child:Lottie.asset('assets/image/user.json',height: 200,width: double.infinity  ) ,),
                    // Add a container with padding that contains the card's title, text, and buttons
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Display the card's title using a font size of 24 and a dark grey color
                          Center(child:  Text(
                            "User",
                            style: TextStyle(
                              fontSize: 24,fontWeight: FontWeight.bold,
                              color:ColorConstants.appbarcolor,
                            ),
                          ),)
                          // Add a space between the title and the text
                          // Display the card's text using a font size of 15 and a light grey colo
                          // Add a row with two buttons spaced apart and aligned to the right side of the card
                        ],
                      ),
                    ),
                    // Add a small space between the card and the next widge
                  ],
                ),
              ),
            ),
            InkWell(onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Afeedback(),),);
            },
              child: Card(margin: EdgeInsets.all(10),elevation: 10,
                // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // Set the clip behavior of the card
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // Define the child widgets of the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                Center(child:Lottie.asset('assets/image/feedback.json',height: 200,width: double.infinity  ) ,),
                    // Add a container with padding that contains the card's title, text, and buttons
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Display the card's title using a font size of 24 and a dark grey color
                          Center(child:  Text(
                            "User Feedback",
                            style: TextStyle(
                              fontSize: 24,fontWeight: FontWeight.bold,
                              color: ColorConstants.appbarcolor,
                            ),
                          ),)
                          // Add a space between the title and the text
                          // Display the card's text using a font size of 15 and a light grey colo
                          // Add a row with two buttons spaced apart and aligned to the right side of the card
                        ],
                      ),
                    ),
                    // Add a small space between the card and the next widge
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
