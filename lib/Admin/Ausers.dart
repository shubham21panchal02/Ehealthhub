import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
  String? data;
  List<dynamic> ? udata;
  bool isLoading=true;
  var l;

  void initState() {
    super.initState();
    getvalue();
  }
  Future<void> getvalue() async {
    setState(() {
      isLoading=true;
    });
    http.Response response = await http.get(
      Uri.parse("https://ehealthub.000webhostapp.com/API/userfetch.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        udata = jsonDecode(data!)["data"];
        l=udata?.length;

        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Afristpage(),),);
      },),backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Users"),),
      body:isLoading ? Center(child: CircularProgressIndicator(color: Colors.black)) : Column(
        children: [

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
                                Text(jsonDecode(data!)["data"][index]["U_NAME"],style: TextStyle(fontSize: 20),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Age :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text(jsonDecode(data!)["data"][index]["AGE"],style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Email :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text(jsonDecode(data!)["data"][index]["EMAIL_ID"],style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 20,),
                              Row(children: [
                                Text("Users Address :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: Text(jsonDecode(data!)["data"][index]["ADDRESS"],style: TextStyle(fontSize: 20),),),
                              ],),
                              SizedBox(height: 21,),

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