import 'dart:convert';

import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Uforthpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Forthpage();
  }
}

class Forthpage extends State<Uforthpage> {
  bool isLoading = true;
  String userName = "T";
  String userEmail = "";
  String data = "";
  var hospitaldata;

  Future<void> getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      userName = setpreference.getString('name')!;
      userEmail = setpreference.getString('email')!;
    });
    http.Response response = await http.post(
      Uri.parse("https://e-healthhub.000webhostapp.com/API/fetch_user_appointment.php"),
      body: {
        "U_ID": setpreference.getString('id'),
      }
    );
    if (response.statusCode == 200)
    {
      print("Failed to fetch data. Status code: ${response.body}");
      setState(() {
        data = response.body;
        hospitaldata = jsonDecode(data)["status"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
      title: Text("Appointment",),
    ),
      body: isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) :
      hospitaldata.length == 0?
          Center(child: Text('No appointment', style:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14)),):
      SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: hospitaldata.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index)  {
                  return  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16,top: 16),
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 8),
                    decoration: BoxDecoration(
                      color: jsonDecode(data)["status"][index]["astatus"] =="Booked"?Color(0xFF2ca5ab):
                      jsonDecode(data)["status"][index]["astatus"] =="Complete"?Color(0xFF08364B):
                      jsonDecode(data)["status"][index]["astatus"] =="Reject"? Colors.redAccent:Color(0xFF4CAF50),
                      // border: Border.all(
                      //   color: Color(0xFF032737),
                      //   width: 4.0,
                      // ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color:  Color(0xFF032737).withOpacity(0.4),
                          offset: const Offset(1, 1),
                          blurRadius: 16,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(24.0),
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  // Text("Full Name: ",
                                  //   textAlign: TextAlign.start,
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.black54,
                                  //       fontSize: 14),
                                  // ),
                                  Text( jsonDecode(data)["status"][index]["hname"],
                                    textAlign: TextAlign.start,
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  Text("Booking Date: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                  Text( jsonDecode(data)["status"][index]["slot_date"] + " "+ jsonDecode(data)["status"][index]["slot_time"],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                  Expanded(
                                    child: Text( jsonDecode(data)["status"][index]["astatus"],
                                      textAlign: TextAlign.start,
                                      style:TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              if(jsonDecode(data)["status"][index]["astatus"] !="Booked") ...[
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          _submit(jsonDecode(data)["status"][index]["appoid"],"Reject");
                                        },
                                        child: Text("Reject",
                                          textAlign: TextAlign.end,
                                          style:TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 16,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          )));
  }

  _submit(String id,String status) async {
    var logindata;

    setState(() {
      isLoading = true;
    });
    final login_url = Uri.parse(
        "https://e-healthhub.000webhostapp.com/API/updateslotstatus.php");
    final response = await http
        .post(login_url, body: {
      "A_ID": id,
      "STATUS": status,
    });
    if (response.statusCode == 200) {
      print(response.body);
      logindata = jsonDecode(response.body);
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
        getData();
      }else{
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
