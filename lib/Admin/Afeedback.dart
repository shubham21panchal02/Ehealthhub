import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/Colour.dart';

class Afeedback extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Afeedbackstate();
  }
}
class Afeedbackstate extends State<Afeedback>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Feedback"),),
      body: Column(
        children: [
          SizedBox(height:20),

          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 5,itemBuilder:(BuildContext Context, int index){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(color: ColorConstants.lightcolor,elevation: 10,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                  ),

                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Text("Users Name :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("shubham panchal",style: TextStyle(fontSize: 20),),
                                ],),
                                SizedBox(height: 20,),
                                Row(children: [
                                  Text("Users PhoneNo. :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("1234567890",style: TextStyle(fontSize: 20),),
                                ],),
                                SizedBox(height: 20,),
                                Row(children: [
                                  Text("Users Feedback :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Expanded(child:Text("this hospital is best in ahmedabad and gujrat",style: TextStyle(fontSize: 20),), ),

                                ],),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } ),
            ),
          )
        ],
      ),
    );
  }
}