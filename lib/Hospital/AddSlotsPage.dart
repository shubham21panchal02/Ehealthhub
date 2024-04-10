import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Widgets/Colour.dart';
import 'CommonClass.dart';

class AddSlotPage extends StatefulWidget {
  const AddSlotPage({Key? key}) : super(key: key);

  @override
  State<AddSlotPage> createState() => _AddSlotPageState();
}

class _AddSlotPageState extends State<AddSlotPage> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  TextEditingController selectDateController = TextEditingController();
  TextEditingController selectTimeController = TextEditingController();
  List<String> timeList = [
    "10:00:00",
    "10:30:00",
    "11:00:00",
    "11:30:00",
    "12:00:00",
    "12:30:00",
    "13:00:00",
    "13:30:00",
    "14:00:00",
    "14:30:00",
    "15:00:00",
    "15:30:00",
    "16:00:00",
    "16:30:00",
  ];
  DateTime? _selectedDate;

  late CommonClass commonClass;

  addSlot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      'H_ID': prefs.getString("id"),
      'STATUS': "Available",
      'S_DATE': selectDateController.text,
      'S_TIME': selectTimeController.text,
    };
    var response = await http.post(Uri.parse("https://ehealthub.000webhostapp.com/API/schedule.php"), body: data);
    commonClass = CommonClass.fromJsonMap(json.decode(response.body.toString()));
    if(response.statusCode == 200) {
      if (!commonClass.error) {
        setState(() {
          _isLoading = false;
        });
        print(response.body);
        Fluttertoast.showToast(
            msg: commonClass.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        Navigator.of(context).pop();
        print(response.body);
      }else{
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
            msg: commonClass.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        print(response.body);
      }
    }else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: Text("Add Sloat",),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(color: ColorConstants.buttonscolor)) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(height: 16,),
                Text(
                  "Select Slot: ",
                  textAlign: TextAlign.start,
                  style:TextStyle(
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select Slot'),
                              content: setupAlertDialogTime(),
                            );
                          }
                      );
                    },
                    style: TextStyle(
                        color: Colors.white
                    ),
                    controller: selectTimeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Slot';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:ColorConstants.buttonscolor,
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
                SizedBox(height: 30.0),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    height: 55.0,
                    minWidth: MediaQuery.of(context).size.width / 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(24.0),
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(5.0))
                    ),
                    onPressed:_submit,
                    child: Text(
                      'Submit',
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color:ColorConstants.buttonscolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        _isLoading = true;
      });
      addSlot();
    }

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
      });
    });
  }


  Widget setupAlertDialogTime() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:timeList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              selectTimeController.text = timeList[index];
              Navigator.pop(context, true);
            },
            title: Text(timeList[index]),
          );
        },
      ),
    );
  }

}
