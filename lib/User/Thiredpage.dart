import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Uthiredpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Thiredpage();
  }

}

class Thiredpage extends State<Uthiredpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top:6,right:0,left: 10,bottom: 6),
          child:Text("Your appoinment has been made",style: TextStyle(color: ColorConstants.buttonscolor,fontSize: 23,fontWeight: FontWeight.bold),) ,),
        Card(color: ColorConstants.buttonscolor,margin:EdgeInsets.all(10),
          child: Column(
            children: [Padding(padding: EdgeInsets.all(0)),
              Card(elevation: 30,color: Color(0xFF9dcdd1),
                // Define the shape of the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                // Define how the card's content should be clipped
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // Define the child widget of the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Add padding around the row widget
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,right: 0,left: 10,bottom: 20
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Add an image widget to display an image
                          Image.network("https://static.vecteezy.com/system/resources/previews/013/141/034/original/book-doctor-appointment-card-template-schedule-hospital-visit-editable-social-media-post-design-flat-color-illustration-for-poster-web-banner-ecard-vector.jpg"
                            ,width: 200,height: 150,),
                          // Add some spacing between the image and the text
                          Container(width: 30),
                          // Add an expanded widget to take up the remaining horizontal space
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Add some spacing between the top of the card and the title
                                Container(height: 5),
                                // Add a title widget
                               Text("Appoinment no. ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(height: 20,),
                                Center(child: Text("20",style: TextStyle(fontSize: 40),))
                                // Add a text widget to display some text
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [Padding(padding: EdgeInsets.all(0)),
                  Card(elevation: 30,color: Color(0xFF9dcdd1),
                    // Define the shape of the card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // Define how the card's content should be clipped
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // Define the child widget of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Add padding around the row widget
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10,right: 10,left: 10,bottom: 10
                            ),
                            child:Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Add an image widget to display an image
                                  Text("ID :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("ASDF12302355",style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            )
                        ),
                        Divider(
                          height: 20,color: Colors.black,thickness:1,
                        ),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.details),
                                    Text("  Appointment Detail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                Container(height: 30,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Padding(padding: EdgeInsets.only(left: 10,right: 30,top: 20,bottom: 20),
                                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Location",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                        Text("Service",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                        Text("Date & Time",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                      ],
                                    ) ,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Ahmedabad",style:TextStyle(fontSize: 20,) ,),
                                        SizedBox(height: 15,),
                                        Text("Ear, Nose",style:TextStyle(fontSize: 20) ,),
                                        SizedBox(height: 15,),
                                        Text("Monday,7pm to 9pm",style:TextStyle(fontSize: 20,) ,),
                                        SizedBox(height: 15,),
                                      ],
                                    )

                                  ],
                                ),

                              ],
                            )
                        ),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.details),
                                    Text(" Personal Infomartion",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                Container(height: 30,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Padding(padding: EdgeInsets.only(left: 10,right: 30,top: 20,bottom: 20),
                                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Name",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                        Text("Age",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                        Text("Adress",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                        SizedBox(height: 15,),
                                      ],
                                    ) ,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("panchal",style:TextStyle(fontSize: 20,) ,),
                                        SizedBox(height: 15,),
                                        Text("20 year",style:TextStyle(fontSize: 20) ,),
                                        SizedBox(height: 15,),
                                        Text("ranip",style:TextStyle(fontSize: 20,) ,),
                                        SizedBox(height: 15,),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(height: 5,),
              Text("* please arrive 15 minits before the scheduled time",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(height: 10,),
            ],
          ),
        ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Ufirstpage(),));
          }, style: ElevatedButton.styleFrom(primary: Color(0xFF0e9096)),
              child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: Text("Back to Home"),))//card
        ],
      ),
    );
  }
}
