import 'dart:convert';

import 'package:devloperproject1/Hospital/AddSlotsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../Widgets/Colour.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SlotListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ad();
  }
}

class ad extends State<SlotListPage> with TickerProviderStateMixin {
  bool isLoading = false;
  String data = "";
  var hospitaldata;
  final formKey = new GlobalKey<FormState>();
  TextEditingController selectDateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.post(
        Uri.parse("https://ehealthub.000webhostapp.com/API/schedule_fetch.php"),
        body: {
          "H_ID": setpreference.getString('id'),
          "S_DATE": selectDateController.text,
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarcolor,
          title: const Text('Slot List'),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSlotPage(),
                    )).whenComplete(() {
                      getData();
                });
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add_circle,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body:  isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) :
          SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                SizedBox(height: 24.0),
                Text(
                  "Select Date: ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      color:Color(0xFF08364B),
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 6,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(2.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.transparent.withOpacity(0.4),
                          blurRadius: 18,
                          offset: Offset(0, 7)),
                    ],
                  ),
                  child: TextFormField(
                    readOnly: true,
                    onTap: (){
                      _pickDateDialog();
                    },
                    style: TextStyle(
                        color: Colors.white
                    ),
                    controller: selectDateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select date';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:ColorConstants.buttonscolor,
                      prefixIcon: Icon(Icons.date_range, color: Colors.white, size: 20),
                      hintText: "Select Date",
                      hintStyle: TextStyle(
                          color: Colors.white70
                      ),
                      errorStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Color(0xFF539cd4),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Color(0xFF539cd4),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(5.0)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color:Color(0xFF539cd4),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                if(hospitaldata != null) ...[
                  hospitaldata.length == 0?
                  Center(child: Text('No Slot', style:TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14)),):
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
                                      child: Text("Slot_ID: "),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        jsonDecode(data)["status"][index]["S_ID"],
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
                                      child: Text("Slot Time: "),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        jsonDecode(data)["status"][index]["S_TIME"],
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
                                        jsonDecode(data)["status"][index]["S_DATE"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ]));
                    },
                  ),
                ],

              ])),
        ));
  }

  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime.now(),
        //what will be the previous supported year in picker
        lastDate: DateTime(2025)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
        selectDateController.text='${DateFormat('yyyy-MM-dd').format(_selectedDate!)}';
        getData();
      });
    });
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
