import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Widgets/Colour.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Adetailpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ad();
  }
}

class ad extends State<Adetailpage> with TickerProviderStateMixin {
  bool isLoading = true;
  String userName = "T";
  String userEmail = "";
  String data = "";
  var hospitaldata;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      userName = setpreference.getString('name')!;
      userEmail = setpreference.getString('email')!;
    });
    http.Response response = await http.post(
        Uri.parse("https://ehealthub.000webhostapp.com/API/fetch_hospital_appointment.php"),
        body: {
          "H_ID": setpreference.getString('id'),
        }
    );
    if (response.statusCode == 200)
    {
      print("Failed to fetch data. Status code: ${response.body}");
      setState(() {
        data = response.body;
        hospitaldata = jsonDecode(data)["appointments"];
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarcolor,
          title: const Text('Appointment Detail'),
        ),
        body:  isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) :
        hospitaldata.length == 0?
        Center(child: Text('No appointment', style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14)),): SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:  hospitaldata.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext Context, int index) {
                    return Card(
                        margin: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey.shade200,
                            )),
                        elevation: 10,
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("User Name: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jsonDecode(data)["appointments"][index]["USER_NAME"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: .5,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Appointment_ID: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jsonDecode(data)["appointments"][index]["A_ID"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: .5,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Sloat: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jsonDecode(data)["appointments"][index]["S_TIME"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: .5,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("status: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jsonDecode(data)["appointments"][index]["STATUS"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: .5,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Date: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jsonDecode(data)["appointments"][index]["S_DATE"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              if(jsonDecode(data)["appointments"][index]["STATUS"] == "Booked") ...[
                                Divider(
                                  height: .5,
                                  color: Colors.black,
                                ),
                              ],


                              Container(
                                /* decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [

                     ]
                   )
               ),  */
                                  child: Column(
                                    children: [
                                      if(jsonDecode(data)["appointments"][index]["STATUS"] == "Booked") ...[
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: TextButton(
                                                onPressed: () {
                                                  _submit(jsonDecode(data)["appointments"][index]["A_ID"],"Complete");
                                                },
                                                child: Text(
                                                  "Complete",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                style: TextButton.styleFrom(
                                                    foregroundColor: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                    backgroundColor: Colors.white,
                                                    elevation: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: TextButton(
                                                onPressed: () {
                                                  _submit(jsonDecode(data)["appointments"][index]["A_ID"],"Reject");
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                style: TextButton.styleFrom(
                                                    foregroundColor: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                    ),
                                                    backgroundColor: Colors.white,
                                                    elevation: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],

                                    ],
                                  ))
                            ]));
                  },
                ),
              ])),
        ));
  }

  _submit(String id,String status) async {
    var logindata;

    setState(() {
      isLoading = true;
    });
    final login_url = Uri.parse(
        "https://ehealthub.000webhostapp.com/API/updateslotstatus.php");
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
