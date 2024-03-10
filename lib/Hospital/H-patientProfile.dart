import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patient_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profile();
  }

}
class profile extends State<patient_profile>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
           title: Text("Patient Profile",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.greenAccent,
      ),
      body:
          Container(

            margin: EdgeInsets.all(10),
            height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/s23.jpg'),
                ),
              
               borderRadius: BorderRadius.circular(15),
                border: Border.all(

                  color: Colors.black,
                  width: 5
                )
              ),
            child: Container(
              decoration:BoxDecoration(

                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.grey.withOpacity(0.5)
                  ]
                )
              ) ,
              child: ListView.builder(itemCount: 1,itemBuilder: (BuildContext Context,int index) {
                    return Card(
                      elevation: 10,
                    child: Column(
                      children: [

                      ],
                    ),

                    );
                  },),
            ),
          ),

            


    );
  }

}