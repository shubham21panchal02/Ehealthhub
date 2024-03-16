import 'dart:convert';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/User/bookappointment.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Uthiredpage extends StatefulWidget {
  final String hospitalImage;
  final String hospitalName;
  final String hospitalAddress;
  final String Speciallist;
  final String fees;
  final String hospitalId;

  Uthiredpage(
      {required this.hospitalImage,
      required this.hospitalName,
      required this.hospitalAddress,
      required this.Speciallist,
      required this.fees,
      required this.hospitalId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Thiredpage();
  }
}

class Thiredpage extends State<Uthiredpage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController bodController = TextEditingController();
  TextEditingController selectSlotController = TextEditingController();
  bool _isLoading = false;
  String timeSlotId = "";
  DateTime? _selectedDate;
  var slotData;
  String slotListData="";

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data:
                MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appbarcolor,
        title: Text(
          "Book Appointment",
        ),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(color:  ColorConstants.buttonscolor)) : SingleChildScrollView(
        child: (Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: ColorConstants.lightcolor,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                    child: Image(
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.hospitalImage),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/image/hospital.png',
                        width: 35,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.hospitalName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset('assets/image/hospital location.png',
                          width: 35),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        widget.hospitalAddress,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Specialist:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        widget.Speciallist,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Fees:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.currency_rupee),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          widget.fees,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Center(
                  //    child: Column(
                  //      mainAxisSize: MainAxisSize.min,
                  //      children: <Widget>[
                  //        Text("${selectedDate.toLocal()}".split(' ')[0]),
                  //        const SizedBox(height: 20.0,),
                  //        // ElevatedButton(
                  //        //   style: TextButton.styleFrom(
                  //        //     backgroundColor: ColorConstants.buttonscolor
                  //        //   ),
                  //        //   onPressed: () => _selectDate(context),
                  //        //   child: const Text('Select date'),
                  //        // ),
                  //      ],
                  //    ),
                  //  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       Text("${selectedTime.toString()}".split(' ')[0]),
                  //       const SizedBox(height: 20.0,),
                  //       ElevatedButton(
                  //         style: TextButton.styleFrom(
                  //             backgroundColor: ColorConstants.buttonscolor
                  //         ),
                  //         onPressed: () => _selectTime(context),
                  //         child: const Text('Select Time'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
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
                      controller: bodController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please select booking date';
                        }
                        return null;
                      },
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xFF032737),
                        prefixIcon: Icon(Icons.date_range, color: Colors.white, size: 20),
                        hintText: "Booking date",
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
                  Padding(padding: EdgeInsets.only(left: 24,right: 16,top: 16,bottom: 16),
                    child: Text("Choose Time slot",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF032737),
                          fontSize: 18),
                    ),),
                  SizedBox(height: 6,),
                  Container(
                    padding: EdgeInsets.only(left: 16,right: 16),
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
                        if(bodController.text.isNotEmpty){
                          if( slotData.length == 0){
                            Fluttertoast.showToast(
                                msg: "No Slot Available",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2
                            );
                          }else{
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Select Slot'),
                                    content: setupAlertDialogTime(),
                                  );
                                }
                            );
                          }

                        }else{
                          Fluttertoast.showToast(
                              msg: "Please select date",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2
                          );
                        }
                      },
                      style: TextStyle(
                          color: Colors.white
                      ),
                      controller: selectSlotController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please select slot';
                        }
                        return null;
                      },
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xFF032737),
                        prefixIcon: Icon(Icons.date_range, color: Colors.white, size: 20),
                        hintText: "Select Slot",
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
                  SizedBox(height: 20,),
                  Center(
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstants.buttonscolor
                            ),
                            onPressed: () {
                              if(timeSlotId == "" && bodController.text.isEmpty){
                                Fluttertoast.showToast(
                                    msg: "Please select Booking date & Time slot",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2
                                );
                              }else{
                                setState(() {
                                  _isLoading = true;
                                });
                                bookAppointment();
                              }
                            },
                            child:Padding(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Appointment",
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
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
        _isLoading = true;
        _selectedDate = pickedDate;
        bodController.text='${DateFormat('yyyy/MM/dd').format(_selectedDate!)}';
        fetchSlotList();
      });
    });
  }

  Future<void> bookAppointment() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    var logindata;
    var data;
    final login_url = Uri.parse(
        "https://e-healthhub.000webhostapp.com/API/add_appointment.php");
    final response = await http
        .post(login_url, body: {
      "U_ID": setpreference.getString('id'),
      "S_ID": timeSlotId,
      "STATUS": "1",
    });
    if (response.statusCode == 200) {
      logindata = jsonDecode(response.body);
      print(data);
      setState(() {
        _isLoading = false;
      });
      if (logindata['error'] == false) {
        Fluttertoast.showToast(
            msg: logindata['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
            Ufirstpage()), (Route<dynamic> route) => false);
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

  Widget setupAlertDialogTime() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: slotData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                timeSlotId = jsonDecode(slotListData)["status"][index]["S_ID"]!;
                selectSlotController.text = jsonDecode(slotListData)["status"][index]["S_TIME"]!;
              });
              Navigator.pop(context, true);
            },
            title: Text(jsonDecode(slotListData)["status"][index]["S_TIME"]!),
          );
        },
      ),
    );
  }

  fetchSlotList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final login_url =
    Uri.parse("https://e-healthhub.000webhostapp.com/API/schedule_fetch.php");
    final response = await http.post(login_url, body: {
      "H_ID": widget.hospitalId,
      "S_DATE": bodController.text,
    });
    var newData;
    if (response.statusCode == 200) {
      newData =jsonDecode(response.body);
      slotData = jsonDecode(response.body)["status"];

      print(slotData);
      setState(() {
        _isLoading = false;
      });
      if (newData['error'] == false) {
        slotListData = response.body;
        Fluttertoast.showToast(
            msg: slotData['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2);
      } else {
        Fluttertoast.showToast(
            msg: newData['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2);
      }
    }
  }


  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
