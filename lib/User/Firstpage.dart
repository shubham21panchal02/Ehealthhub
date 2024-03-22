import 'dart:convert';

import 'package:devloperproject1/Login.dart';
import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/User/Secondpage.dart';
import 'package:devloperproject1/User/Services.dart';
import 'package:devloperproject1/User/feedback.dart';
import 'package:devloperproject1/User/profie_user.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Ufirstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home();
  }
}

class Home extends State<Ufirstpage> {
  String data = "";
  var hospitaldata;
  bool isLoading = true;
  String userName = "T";
  String userEmail = "";

  void initState() {
    super.initState();
    getData("hospital");
  }

  Future<void> getData(String category) async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      userName = setpreference.getString('name')!;
      userEmail = setpreference.getString('email')!;
    });
    http.Response response = await http.get(
      Uri.parse("https://e-healthhub.000webhostapp.com/API/h_fetchapi1.php"),
    );
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        hospitaldata = jsonDecode(data)["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }
  }

  List imageList = [
    {"id": 1, "image_path": 'assets/image/ad1.jpg'},
    {"id": 2, "image_path": 'assets/image/ad2.jpg'},
    {"id": 3, "image_path": 'assets/image/ad3.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: LoadingAnimationWidget.discreteCircle(color: ColorConstants.drawercolor, size: 30)
    ):

    AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstants.drawercolor,
              Color(0xFF9dcdd1).withOpacity(0.2)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarcolor,
          title: Text('Hi, $userName'),
          leading: IconButton(
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
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
              SizedBox(height: 16),
              Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 10,
                  shadowColor: Colors.cyan,
                  color: Color(0xFF9dcdd1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/image/hospital.png',
                          width: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Make Hospital Appointment",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Make Appointment With Hospital For Tomorrow Without Managing Your Current Activity",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => USecondpage(),
                              ),
                            );
                          },
                          child: Text("Find Hospital"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0e9096),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 0,right: 100),
                child: Text(
                  "Top 10 Best Hospital",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Calibri',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  height: 300,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hospitaldata.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        shadowColor: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image(
                                image: NetworkImage(
                                  "https://e-healthhub.000webhostapp.com/API/" +
                                      jsonDecode(data!)["data"][index]["H_IMG"],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      jsonDecode(data!)["data"][index]
                                      ["H_NAME"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 41),
            ],
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorConstants.appbarcolor,
                        foregroundColor: Colors.black,
                        radius: 70,
                        child: Center(
                          child: Text(
                            userName[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Name : ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            Text(
                             userName,
                              style: TextStyle(
                                fontSize: 15,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Email : ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              userEmail,
                              style: TextStyle(
                                fontSize: 15,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 10,
                color: ColorConstants.appbarcolor,
                thickness: 2,
              ),
              ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => user_profile(),
                          ),
                        );
                      },
                      leading: Icon(Icons.account_circle_rounded),
                      title: Text('Edit Profile'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddFeedbackPage(),
                          ),
                        );
                      },
                      leading: Icon(Icons.favorite),
                      title: Text('Feedback'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Uforthpage(),
                          ),
                        );
                      },
                      leading: Icon(Icons.details),
                      title: Text('Appointment Details'),
                    ),
                    ListTile(
                      onTap: () async {
                        final pref = await SharedPreferences.getInstance();
                        await pref.clear();
                        await pref.setBool('seen', true);
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Loginpage(),
                          ),
                              (Route<dynamic> route) => false,
                        );
                      },
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                    ),
                  ],
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Terms of Service | Privacy Policy',style: TextStyle
                    (color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
