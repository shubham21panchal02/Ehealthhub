import 'dart:convert';

import 'package:devloperproject1/Admin/Afristpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class Ahospital extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Ahospitalstate();
  }
}
class Ahospitalstate extends State{
  TextEditingController hidController = TextEditingController();
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
      Uri.parse("https://ehealthub.000webhostapp.com/API/h_fetchapi1.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        hdata = jsonDecode(data!)["data"];
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
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Afristpage(),),);
      },),backgroundColor: ColorConstants.appbarcolor,centerTitle: true,title: Text("Hospital"),),
      body:  isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) :
      Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                  itemCount: hdata!.length ,itemBuilder:(BuildContext Context, int index){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(elevation: 10,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(15)),
                          child:Image(
                          image:NetworkImage (
                    "https://ehealthub.000webhostapp.com/API/" + jsonDecode(data!)["data"][index]["H_IMG"],
                    ),),),

                        Container(

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(

                                    children: [
                                    Icon(Icons.local_hospital),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    Expanded(child: Text(jsonDecode(data!)["data"][index]["H_NAME"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                  ],),
                                ),
                                SizedBox(height: 20,),
                                Row(children: [
                                  Icon(Icons.location_on_outlined),
                                  Expanded(child: Text(jsonDecode(data!)["data"][index]["ADDRESS"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],),
                                SizedBox(height: 20,),
                                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                  ElevatedButton(onPressed:(){
                                    _submit(jsonDecode(data!)["data"][index]["H_ID"]);
                                  }, child: Text("Remove"),

                                    style: ElevatedButton.styleFrom(primary: ColorConstants.appbarcolor,

                                  ),)
                                ],)
                              ],
                            ),
                          ),

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
  Future<void> _submit(String id) async {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://ehealthub.000webhostapp.com/API/removehospital.php");

      final response = await http
          .post(login_url, body: {
        "H_ID": id,

      });
      if (response.statusCode == 200) {
        print("object");
        logindata = jsonDecode(response.body);
        print(logindata);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          getvalue();
        }
        else{
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
        }
      }
  }
}
