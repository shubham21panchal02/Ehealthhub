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
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Afristpage(),),);
      },),backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Users"),),
      body: Column(
        children: [
          SizedBox(height:20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                hintText:" Search users",
                leading:Icon(Icons.search,color: ColorConstants.drawercolor,),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 5,itemBuilder:(BuildContext Context, int index){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(elevation: 10,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Column(
                      children: [
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