import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Colour.dart';

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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                child: Text("Services",style: TextStyle(fontSize: 30,color:ColorConstants.appbarcolor ,fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 100,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (BuildContext Context, int index) {
                          return Card(
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),

                            shadowColor: Colors.black,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),),
                               Icon(Icons.earbuds,color: ColorConstants.appbarcolor,size: 52,),
                                Divider(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Ear ,Nose & Throat",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text("Monday,Ttuesday,wednesday...",style: TextStyle(fontSize: 15)
                                     ),
                                   )
                              ],
                            ),
                          );
                        }),
              ),



            ],
          ),
        ),
    );
  }
}
