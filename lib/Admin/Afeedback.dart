import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/Colour.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Afeedback extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Afeedbackstate();
  }
}
class Afeedbackstate extends State<Afeedback>{
  String? data;
  List<dynamic> ? hdata;
  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data1;
  bool isLoading = false;
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
      Uri.parse("https://e-healthhub.000webhostapp.com/API/fetchallfeedback.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        hdata = jsonDecode(data!)["feedback"];
        l=hdata?.length;

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
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Feedback"),),
      body: isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) :Column(
        children: [
          SizedBox(height:20),

          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                  itemCount:hdata!.length,itemBuilder:(BuildContext Context, int index){
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
                                  Text(jsonDecode(data!)["feedback"][index]["U_NAME"],style: TextStyle(fontSize: 20),),
                                ],),
                                SizedBox(height: 20,),
                                Row(children: [
                                  Text("Users Feedback :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Expanded(child:Text(jsonDecode(data!)["feedback"][index]["COMMENT"],style: TextStyle(fontSize: 20),), ),

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