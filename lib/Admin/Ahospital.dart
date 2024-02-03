import 'package:devloperproject1/Admin/Afristpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ahospital extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Ahospitalstate();
  }
}
class Ahospitalstate extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Afristpage(),),);
      },),backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Hospital"),),
      body: Column(
        children: [
          SizedBox(height:20),
           Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
               child: SearchBar(
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
                        Image.asset('assets/image/hospital.png',height: 100,),
                        Container(
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(Icons.local_hospital),
                                Text(" Hospital name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Icon(Icons.location_on_outlined),
                                Expanded(child: Text(" 202, 3rd floor, c g road , ahmedabad, pin-382480",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
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