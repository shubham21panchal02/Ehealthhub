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
     backgroundColor:  Color(0xFF9dcdd1),
       appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
       title: Center(
         child: Text('Hospital',style: TextStyle(
           fontSize: 25,fontWeight: FontWeight.bold,
         ),),

       ),
       toolbarHeight: 60,),

     body:
     SingleChildScrollView(

        child:Column(

            children: [

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Adetailpage(),));
            },
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomLeft: Radius.circular(90)),
        boxShadow:[
                    BoxShadow(
                      color: Colors.black,
                      blurStyle: BlurStyle.outer,

                    )
                  ],

                  gradient: LinearGradient(
                      begin: Alignment.topCenter,

                      colors: [

                        Colors.grey,

                        Colors.white,
                      ]
                  )
              ),
              margin: EdgeInsets.only(
                right: 30,top: 30,left: 30,
              ),

              child: Column(

                children: [

                  Lottie.asset('assets/image/h-Appointment.json',
                    height: 250,width: double.infinity,fit:BoxFit.fill,

                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text("Appointment Detail",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),

          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomLeft: Radius.circular(90)),
                boxShadow:[
                BoxShadow(
                  color: Colors.black,
                  blurStyle: BlurStyle.outer,

                )
              ],

              gradient: LinearGradient(
                begin: Alignment.topCenter,

                colors: [

                    Colors.grey,

                  Colors.white,
                ]
              )
            ),
            margin: EdgeInsets.only(
              right: 30,top: 30,left: 30,
            ),

              child: Column(

                children: [

                  Lottie.asset('assets/image/s.json',
                    height: 250,width: 350,fit:BoxFit.fill,

                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text("Patient Profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
        ]
      )
    )

   );
  }

}