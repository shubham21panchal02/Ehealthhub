

import 'dart:async';

import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





class BookingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  var scheduledata;
  var data;
  bool isLoading = false;
  TextEditingController s_dateController = TextEditingController();
  TextEditingController s_timeController = TextEditingController();

  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

//get token for insert booking date and time into database


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: ColorConstants.appbarcolor,
        toolbarOpacity: 0.5,
        title: Text("Slot"),
      ),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[

                  _tableCalendar(

                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Center(
                      child: Text(
                        'Select Consultation Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
            child: Container(

              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 30),
              alignment: Alignment.center,
              child: const Text(
                'Weekend is not available, please select another date',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          )
              : SliverGrid(
            delegate: SliverChildBuilderDelegate(

                  (context, index) {
                return InkWell(
              splashColor: Colors.transparent,


                  onTap: () {
                    setState((

                        ) {

                      _currentIndex = index;

                    });
                  },
                  child: Container(

                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: _currentIndex == index
                          ? Colors.greenAccent
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}:00 ${index + 1 > 18 ? "PM" : "AM"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                        _currentIndex == index ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
              childCount: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.5),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: ElevatedButton(
                  child: Text("submit"),

                  onPressed:_submit

              ),
            ),
          ),
        ],
      ),
    );
  }

  //table calendar
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      //json
      lastDay: DateTime(2024, 04),
      //json
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
        BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 0 || selectedDay.weekday == 0) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }

  Future<void> _submit() async {
    final login_url = Uri.parse(
        "https://ehealthub.000webhostapp.com/API/schedule.php");

    final response = await http
        .post(login_url, body: {
      "S_DATE": s_dateController.text,
      "S_TIME": s_timeController.text,


    });
    if (response.statusCode == 200) {
      print(scheduledata);
      scheduledata = jsonDecode(response.body);
      data = jsonDecode(response.body)['user'];
      print(scheduledata);
      setState(() {
        isLoading = false;
      });

      if (['error'] == false) {
        Fluttertoast.showToast(
            msg: scheduledata['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
      }
      else {
        Fluttertoast.showToast(
            msg: ['invalid '].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
      }
    }
  }


}
