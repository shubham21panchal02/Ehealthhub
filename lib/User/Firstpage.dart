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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class  Ufirstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home();
  }
}

class Home extends State<Ufirstpage> {

  String data="";
  var hospitaldata;
  bool isLoading=true;

  void initState() {
    super.initState();
    getData("hospital");
  }
  Future<void> getData(String category) async {
    setState(() {
      isLoading=true;
    });
    http.Response response =
    await http.get(
      Uri.parse("https://e-healthhub.000webhostapp.com/API/h_fetchapi1.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        hospitaldata = jsonDecode(data!)["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }
  }
  List imageList=[
    {"id":1,"image_path":'assets/image/ad1.jpg'},
    {"id":2,"image_path":'assets/image/ad2.jpg'},
    {"id":3,"image_path":'assets/image/ad3.jpg'},
  ];
  final CarouselController carouselController=CarouselController();
  int currentIndex=0;
  String userName = "User";
  final _advancedDrawerController = AdvancedDrawerController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AdvancedDrawer(
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
        ),
        child: Scaffold(
          appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
            title: Text('Hi, $userName' ),
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
            actions: [
              Icon(Icons.notifications),
            ],
          ),
          body:
          Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        print(currentIndex);
                      },
                      child:CarouselSlider(
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
                            onTap: () => carouselController.animateToPage(entry.key),
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


                Expanded(
               child:  SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 child: Container(
                          alignment: Alignment.topLeft,

                          child:  Column(
                            children: [

                              Center(
                                child: Card(margin: EdgeInsets.all(20),
                                    elevation: 10,shadowColor: Colors.cyan,
                                    color: Color(0xFF9dcdd1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        bottomLeft: Radius.circular(16.0))),
                                    child: Padding(padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                                      child:Column(
                                        children: [
                                          Image.asset('assets/image/hospital.png',width: 40,),
                                          SizedBox(height: 5,),
                                          Center(child: Text("Make Hospital Appoinment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                          SizedBox(height: 5,),
                                          Center(child: Text("Make Appoinment With Hospital For Tomorrow Without Mannageing Your Current Activity",
                                          textAlign: TextAlign.center,),),
                                          SizedBox(height: 20,),

                                          ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => USecondpage(),));
                                          }, child:Text("Find Hospital"),
                                            style:ElevatedButton.styleFrom(primary: Color(0xFF0e9096),shape: RoundedRectangleBorder(
                                                borderRadius:BorderRadius.all(Radius.circular(20))
                                            )),)
                                        ],
                                      ),)
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                                child: Text("Top 10 Best Hospital",style: TextStyle(fontSize: 25,fontFamily: 'Calibri',
                                color: Colors.black,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(45),

                                        ),
                                    height: 300,

                                      child:InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => USecondpage(

                                          )
                                          ));
                                        },
                                        child:
                                      GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                          itemCount: hospitaldata.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5),
                                          itemBuilder: (BuildContext Context, int index) {
                                            return Card(
                                             elevation: 10,
                                              shadowColor: Colors.black,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [Expanded(child:
                                                  Image(
                                                    image: NetworkImage("https://e-healthhub.000webhostapp.com/API/" + jsonDecode(data!)["data"][index]["H_IMG"]),
                                                  ),),
                                                   Divider(
                                                     height: 10,
                                                   ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      bottom: 10,
                                                    ),
                                                    child: Expanded(child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(jsonDecode(data!)["data"][index]["H_NAME"],style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20, ),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            right: 10
                                                          ),
                                                        ),
                                                        Row(children: [
                                                          Icon(Icons.star,color: Colors.yellow,)
                                                        ],

                                                        ),
                                                      ]
                                                  )))
                                                ],
                                              ),
                                            );
                                          }),

                                ),
                              ),),
                             SizedBox(
                               height: 41,
                             ),
                            ],
                          )
                      ),
               ),
                  ),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Uforthpage()));
                },style: ElevatedButton.styleFrom(
                    primary: ColorConstants.buttonscolor
                ),
                    child: Padding(padding: EdgeInsets.only(top: 20,bottom: 20,left: 100,right: 100),
                      child: Text("Appointment details"),)),
                SizedBox(height: 20,)
              ],
            ),
          ),
        drawer: SafeArea(
          child: Container(

            child:Container(
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
                            child: Center(child: Text("D",style: TextStyle(fontSize: 50
                              ,),),)
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Name : ",style: TextStyle(fontSize: 15,),),
                                Text("Dhruv",style: TextStyle(fontSize: 15,))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Age : ",style: TextStyle(fontSize: 15,),),
                                Text("20",style: TextStyle(fontSize: 15,))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Email : ",style: TextStyle(fontSize: 15,),),
                                Text("dhruv123@gmail.com",style: TextStyle(fontSize: 15,))
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => user_profile(),));
                          },
                          leading: Icon(Icons.account_circle_rounded),
                          title: Text('Edit Profile'),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => feedback(),));
                          },
                          leading: Icon(Icons.favorite),
                          title: Text('Feedback'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                        ListTile(
                          onTap: () async{
                            final pref =await SharedPreferences.getInstance();
                            await pref.clear();
                            await pref.setBool('seen',true);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
                            (BuildContext context)=>Loginpage()),(
                            Route<dynamic>route) => false);
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
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),),
          ),
        ));
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

