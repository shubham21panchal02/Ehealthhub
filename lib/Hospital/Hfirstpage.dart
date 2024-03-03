import 'dart:ui';

import 'package:devloperproject1/Hospital/profile.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/Colour.dart';
import 'H-AppointmentDettail.dart';


class h_firstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return hopital();
  }

}
class hopital extends State<h_firstpage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(

       appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
       title: Center(
         child: Text('Hospital',style: TextStyle(
           fontSize: 25,fontWeight: FontWeight.bold,
         ),),

       ),
       actions: [
         InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => profile(),));
         },
           child: Padding(
             padding: EdgeInsets.all(8),
             child: Icon(Icons.account_circle_sharp,
             size: 30,),
           ),
         )
       ],
       toolbarHeight: 60,),
          drawer: Drawer(
            child: Column(
              children: [

                Stack(children: [
            Container(
            height: 300,

              decoration: BoxDecoration(
                
                image: DecorationImage(image:ExactAssetImage("assets/image/th.jpg",),fit: BoxFit.cover),

              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX:10,
                    sigmaY: 10
                  ),
                  child:  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [

                          Colors.white.withOpacity(0.0)
                        ])
                    ),
                  ),
                ),

              ),
               
            ),

                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: CircleAvatar(
                        child: ClipRRect(

                        ),
                        radius: 80,
                        backgroundImage: AssetImage("assets"
                            "/image/th.jpg",),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 210),
                    child: Align(
                          alignment: Alignment.center,
                      child: Text("Apollo Hospital",style: TextStyle(color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                    ),
                  )
                ],


                  ),
                Divider(
                  height: 1,
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent.shade200,
                        Colors.white
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Card(

                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            leading: Icon(Icons.home),

                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Card(

                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            leading: Icon(Icons.home),

                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Card(

                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            leading: Icon(Icons.home),

                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Card(

                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            leading: Icon(Icons.home),

                          ),
                        ),
                      ),                     Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Card(

                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("Home"),
                            leading: Icon(Icons.home),

                          ),
                        ),
                      ),


                    ],
                  ),
                )

              ],
            ),
          ),
     body: SingleChildScrollView(
       scrollDirection:  Axis.vertical,
       child:Column(
         children:[
           Container(
             height: 300,
             child: Image.asset("assets/image/th.jpg",width: double.infinity,fit: BoxFit.cover,),
           ),
           SizedBox(
             height: 3,
           ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [

                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Adetailpage(),));
                   },
                   child:Container(

                     height: 200,
                     width: 250,
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white38,
                           blurRadius: 5,
                           blurStyle: BlurStyle.normal,

                         )
                       ],
                         borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: Colors.black,
                         width: 0.2
                       )
                     ),
                     child: Card(
                       elevation: 10,

                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: Column(
                         children: [
                           Image.asset("assets/image/Firstpage.jpg"),
                           Text("Appointment Detail",style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 15,
                               color: Colors.black
                           ),)
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 5,
                 ),
                 Container(
                   height: 200,
                   width: 250,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                           color: Colors.black,
                           width: 0.2
                       ),
                    boxShadow: [ BoxShadow(
                       color: Colors.white38,
                       blurRadius: 5,
                       blurStyle: BlurStyle.normal,

                     )
                     ],
                   ),
                   child: Card(
                     elevation: 10,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: Column(
                       children: [
                         Image.asset("assets/image/Firstpage.jpg"),
                         Text("Patient Profile",style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 15,
                           color: Colors.black
                         ),)
                       ],
                     ),
                   ),
                 )
               ],
             ),
           )
         ]
       ),
       
     )


   );
  }

}