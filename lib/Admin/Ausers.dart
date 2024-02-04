import 'package:flutter/material.dart';

import '../Widgets/Colour.dart';
import 'Afristpage.dart';

class Ausers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Ausersstate();
  }
}
class Ausersstate extends State<Ausers>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor:Color(0xFF9dcdd1),
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Afristpage(),),);
      },),backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Users"),),
      body: Column(
        children: [
          SizedBox(height:20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:TextField(style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                decoration: (InputDecoration(filled: true,
                  fillColor: Colors.white,label: Row(
                children: [
                Icon(Icons.search),
                    Text("Search Hospital"),
                ],
              ),
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(50) ,
                      borderSide:BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: "Search users",)
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 5,itemBuilder:(BuildContext Context, int index){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(elevation: 10,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Column(
                      children: [Padding(padding: EdgeInsets.all(10),child:
                        Container(
                          child: Column(
                            children: [
                              Row(children: [
                                Text("Users Name :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("shubham panchal",style: TextStyle(fontSize: 20),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Age :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text("20",style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Email :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text("shubham@gmail.com",style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Password :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text("sggdsj2121",style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 20,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                ElevatedButton(onPressed: (){}, child: Text("Remove"),
                                  style: ElevatedButton.styleFrom(primary: ColorConstants.appbarcolor
                                  ),)
                              ],)
                            ],
                          ),
                        ),)
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