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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Align(
                 alignment: Alignment.center,
              child: Text("Patient Profile",style: TextStyle(fontSize: 30),),

          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: ListView.builder(itemCount: 1,itemBuilder: (BuildContext Context,int index) {
              return Card(
                child: Column(
                  children: [

                  ],
                ),
              );
            },),

          )
        ],
      ),
    );
  }

}