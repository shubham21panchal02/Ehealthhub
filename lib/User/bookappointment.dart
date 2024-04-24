import 'dart:convert';

import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart' as http;

class sloat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Sloatstate();
  }

}
class Sloatstate extends State<sloat>{
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.monthsPerYear),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  String data="";
  var schedule;
  bool isLoading=true;

  void initState() {
    super.initState();
    getData("schedule");
  }
  Future<void> getData(String category) async {
    setState(() {
      isLoading=true;
    });
    http.Response response =
    await http.get(
      Uri.parse("https://ehealthub.000webhostapp.com/API/schedule_fetch.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        schedule = jsonDecode(data!)["data"];
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor:ColorConstants.appbarcolor,
          title: Text(
            "Apply Slot Booking",
          ),
        ),
        body:Center(
          child: Column(
            children:<Widget> [
              Expanded(child:
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: (){
                      },
                      child:Card(
                        child:ListTile(
                          title: Text("20:33:10"),
                          trailing:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("Book"),
                            ),
                          ),
                        ),)
                  );
                },),)
            ],
          ),
        )

    );
  }
}