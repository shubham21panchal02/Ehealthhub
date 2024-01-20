import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Registerstate();
  }
}

class Registerstate extends State<Register>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build ==>
    return Scaffold(
    body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(color:Color(0xFF0e9096),
              child: SingleChildScrollView(

                  padding: EdgeInsets.only(left: 15,top: 120),
                  child: Row(children: [Container(
                    child: Column(
                      children: [
                        Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                        Text("Create your account",style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                    Container(margin: EdgeInsets.only(
                        left: 120
                    ),
                      child:  Image.network("https://cdn3d.iconscout.com/3d/premium/thumb/heart-checkup-report-4034067-3337543.png?f=webp",width:120,height: 100,fit: BoxFit.fill,),
                    ),
                  ],)
              )     ),
          Container(margin: EdgeInsets.all(20),
              child: Column(
                  children: [
                    TextField(decoration: InputDecoration(labelText: "Name",prefixIcon:Icon(Icons.account_circle),prefixIconColor:Color(0xFF0e9096) ,labelStyle: TextStyle(color: Colors.black),hintText: "Name",focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black)
                    ),enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color(0xFF0e9096),)
                    ),),),
                    SizedBox(height:20 ),
                    TextField(decoration: InputDecoration(labelText: "Phone",prefixIcon:Icon(Icons.phone),prefixIconColor:Color(0xFF0e9096),labelStyle: TextStyle(color: Colors.black),hintText: "Ex:10 digit",focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black)
                    ),enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color(0xFF0e9096),)
                    ),),keyboardType:  TextInputType.number,),
                    SizedBox(height:20 ),
                    TextField(decoration: InputDecoration(labelText: "Age",prefixIcon:Icon(Icons.man),prefixIconColor:Color(0xFF0e9096),labelStyle: TextStyle(color: Colors.black),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Colors.black)
                    ),enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color(0xFF0e9096),)
                    ),),keyboardType:  TextInputType.number),
                    SizedBox(height:20 ),
                    TextField(decoration: InputDecoration(labelText: "Email",prefixIcon:Icon(Icons.email),prefixIconColor:Color(0xFF0e9096),labelStyle: TextStyle(color: Colors.black),hintText: "Email",focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black)
                    ),enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color(0xFF0e9096),)
                    ),),),
                    SizedBox(height:20 ),
                    TextField(decoration: InputDecoration(labelText: "Password",prefixIcon:Icon(Icons.lock),prefixIconColor:Color(0xFF0e9096),labelStyle: TextStyle(color: Colors.black),focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black)
                    ),enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color(0xFF0e9096),)
                    ),
                      hintText: "password",)),
                    SizedBox(height:50),
                    ElevatedButton(onPressed: (){}, child:Text("Register"),style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0e9096)
                    )
                    ),
                  ])
          ),

        ],
      ),
    )

    );
  }
}