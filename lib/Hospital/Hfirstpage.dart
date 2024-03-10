import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:devloperproject1/Hospital/H-patientProfile.dart';
import 'package:devloperproject1/Hospital/p.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'H-AppointmentDettail.dart';
import 'h_feedback.dart';

class h_firstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return hopital();
  }
}

class hopital extends State<h_firstpage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/image/had1.jpeg'},
    {"id": 2, "image_path": 'assets/image/had2.jpeg'},
    {"id": 3, "image_path": 'assets/image/had3.jpeg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  String userName = "User";
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorConstants.lightcolor,
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarcolor,
          title: Center(
            child: Text(
              'Hospital',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 30,
                ),
              ),
            )
          ],
          toolbarHeight: 60,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: ColorConstants.appbarcolor,
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: CircleAvatar(
                        child: ClipRRect(),
                        radius: 80,
                        backgroundImage: AssetImage(
                          "assets"
                          "/image/th.jpg",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 210),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Apollo Hospital",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                height: 1,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            trailing: Icon(Icons.home),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => feed(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: Text("Feedback"),
                              trailing: Icon(Icons.feedback_outlined),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                decoration: BoxDecoration(),
                child: Card(
                  color: ColorConstants.appbarcolor,
                  elevation: 1,
                  child: ListTile(
                    title: Text("Log Out"),
                    trailing: Icon(Icons.logout),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.red
                                    : Colors.teal),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Adetailpage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/Firstpage.jpg',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                         SizedBox(
                           height: 10,
                         ),
                            Text('Appointment Detail'),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 1,
            ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => patient_profile(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/p12.jpg',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Patient Profile'),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )



 ]),
        ));
  }
}
