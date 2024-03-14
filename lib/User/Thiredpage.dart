import 'dart:convert';

import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;

class Uthiredpage extends StatefulWidget{
  final String hospitalImage;
  final String hospitalName;
  final String hospitalAddress;
  final String Speciallist;
  final String fees;
  final String hospitalId;

  Uthiredpage({required this.hospitalImage,required this.hospitalName,required this.hospitalAddress,
    required this.Speciallist,required this.fees,required this.hospitalId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Thiredpage();
  }
}

class Thiredpage extends State<Uthiredpage>{
  TextEditingController s_dateController = TextEditingController();
  TextEditingController s_timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var scheduledata;
  var data;
  bool isLoading = false;

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext? context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: Text("Book Appointment",),
      ),
      body:SingleChildScrollView(
          child: Form(
            key:_formKey ,
            child: (
            Column(
              children: [
              Card(margin: EdgeInsets.all(10),
              elevation: 10,
              color: ColorConstants.lightcolor,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(widget.hospitalImage,),
                      Row(children: [
                        Image.asset('assets/image/hospital.png',
                        width: 35,),
                        Text(
                          widget.hospitalName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                              'assets/image/hospital location.png',
                              width: 35),
                          Expanded(
                              child: Text(
                                widget.hospitalAddress,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/image/doctor.jpg',
                          width:35),
                         Expanded(child: Text("Dr.Panchal Dhruv",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Specialist:",style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Expanded(child: Text(widget.Speciallist,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fees:",style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Icon(Icons.currency_rupee),
                          Expanded(child: Text(widget.fees,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("${selectedDate.toLocal()}".split(' ')[0]),
                            const SizedBox(height: 20.0,),
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: ColorConstants.buttonscolor
                              ),
                              onPressed: () => _selectDate(context),
                              child: const Text('Select date'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("${selectedTime.toString()}".split(' ')[0]),
                            const SizedBox(height: 20.0,),
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: ColorConstants.buttonscolor
                              ),
                              onPressed: () => _selectTime(context),
                              child: const Text('Select Time'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

    Center(child:
    ElevatedButton(onPressed: () {_submit();
      QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Book Appointment Successfully!',
            autoCloseDuration: const Duration(seconds: 5),
            showConfirmBtn: false,
      );
    },
            child: Padding(padding: EdgeInsets.only(top: 20,bottom: 10,left: 100,right: 100),
      child: Text("Book Now",),
            )),),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),

              ],
            )
            ),
          ),
        ),

    );
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

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://e-healthhub.000webhostapp.com/API/schedule.php");

      final response = await http
          .post(login_url, body: {
        "S_DATE": s_dateController.text,
        "S_TIME": s_timeController.text,
      });
      if (response.statusCode == 200) {
        print("object");
        scheduledata = jsonDecode(response.body);
        data =
        jsonDecode(response.body)['user'];
        print(scheduledata);
        setState(() {
          isLoading = false;
        });
        if (scheduledata['error'] == false) {
          Fluttertoast.showToast(
              msg: scheduledata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Ufirstpage()),
                  (route) => false);
        }else{
          Fluttertoast.showToast(
              msg: scheduledata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
        }
      }
    }
  }
}


