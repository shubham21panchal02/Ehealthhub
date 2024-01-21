import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Ufirstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return firstpage();
  }
}

class firstpage extends State<Ufirstpage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title:Text("HELLO"),backgroundColor: Color(0xFF0e9096),centerTitle:true,),
      drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(child:Text("Shubham",)),
          ListTile(title: Text("Dhruv"),)
        ],
      ),
    ),
    body:Column(
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
                Center(child: Text("Make Appoinment With Hospital For"),),
                Center(child:Text("Tomorrow Without Mannageing Your Current")),
                Center(child:Text("Activity")),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: (){}, child:Text("Find Hospital"),
                  style:ElevatedButton.styleFrom(primary: Color(0xFF0e9096),shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.all(Radius.circular(20))
                )),)
              ],
            ),)
          ),
        )
      ],
    ));
  }
}

