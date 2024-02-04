import 'dart:ffi';

import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/User/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Colour.dart';

class USecondpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Second();
  }
}

class Second extends State<USecondpage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appbarcolor,
        title: Text('Hospitals'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  color: Color(0xFF9dcdd1),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image(
                          image: NetworkImage(
                              'https://sys.mediflam.com/OfflineUploads/HospitalImage/Sterling_Hospital.JPG'),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              right: 0, top: 10, bottom: 0, left: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/image/hospital.png',
                                      width: 35),
                                  Text(
                                    "  Sterling Hospital",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
                                    "206, Siddhraj Zori, Next to Essar petrol pump, Sargasan, Gandhinagar: 382421. Gujarat, India.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Servicespage(),
                                            ));
                                      },
                                      child:(Text("View Services",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      )
                                       )),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
              itemCount: 10,
              shrinkWrap: true,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
