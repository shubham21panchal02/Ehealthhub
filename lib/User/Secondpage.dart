import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class USecondpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Second();
  }
}
class Second extends State<USecondpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [Padding(padding: EdgeInsets.only(top: 25,)),
              Card(
                elevation: 10,
                color: Color(0xFF9dcdd1),
                shape: BeveledRectangleBorder(borderRadius:BorderRadius.only(topRight: Radius.circular(16.0),
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0))),
                child: Column(
                  children: [ClipRRect(
                    borderRadius: BorderRadius.only(topRight:Radius.circular(15),topLeft:Radius.circular(15)),
                    child: Image(
                      image: NetworkImage(
                          'https://sys.mediflam.com/OfflineUploads/HospitalImage/Sterling_Hospital.JPG'),
                    ),
                  ),
                    Padding(padding: EdgeInsets.only(right:300,top: 10,bottom: 100),
                    child: Row(
    children: [
                        Icon(Icons.telegram_outlined),
                      Text("3.1km",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    ],
    )),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
