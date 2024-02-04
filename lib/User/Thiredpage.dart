import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Uthiredpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Thiredpage();
  }
}

class Thiredpage extends State<Uthiredpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: Text("Book Appointment",),
      ),
      body:SingleChildScrollView(
        child: (
        Column(
          children: [
          Card(margin: EdgeInsets.all(10),
          elevation: 10,
          color: ColorConstants.lightcolor,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Image.asset('assets/image/hospital.png',
                  width: 35,),
                  Text(
                    "  Sterling Hospital",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/image/hospital location.png',
                        width: 35),
                    Expanded(
                        child: Text(
                          "206, Siddhraj Zori, Next to Essar petrol pump, Sargasan, Gandhinagar: 382421. Gujarat, India.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Image.asset('assets/image/doctor.jpg',
                    width:35),
                   Expanded(child: Text("Dr.Panchal Dhruv",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Specialist:",style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    Expanded(child: Text("ENT",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fees:",style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    Icon(Icons.currency_rupee),
                    Expanded(child: Text("500",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    )
                  ],
                ),Center(child:
                    ElevatedButton(onPressed: () {}, child: Text("Book Now",),)),
                SizedBox(
                  height: 10,
                ),
                Container(
                )
              ],
            ),
          ),
          ],
        )
        ),
      )
    );
  }
}