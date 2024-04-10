
import 'dart:convert';

import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/User/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Widgets/Colour.dart';

class USecondpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Second();
  }
}

class Second extends State<USecondpage> {

  String data="";
  var hospitaldata;
  bool isLoading=true;

  void initState() {
    super.initState();
    getData("hospital");
  }
  Future<void> getData(String category) async {
    setState(() {
      isLoading=true;
    });
    http.Response response =
    await http.get(
      Uri.parse("https://ehealthub.000webhostapp.com/API/h_fetchapi1.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        hospitaldata = jsonDecode(data!)["data"];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appbarcolor,
        title: Text('Hospitals'),
      ),
      body: isLoading ? Center(child: LoadingAnimationWidget.discreteCircle(color: ColorConstants.drawercolor, size: 30)
      ): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  color: Colors.white,
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
                              "https://ehealthub.000webhostapp.com/API/" + jsonDecode(data)["data"][index]["H_IMG"]),
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
                                  SizedBox(width: 8,),
                                  Expanded(child:
                                  Text(
                                   jsonDecode(data)["data"][index]["H_NAME"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),)
                                ],
                              ),
                              SizedBox(
                                height: 10
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/image/hospital location.png',
                                      width: 35),
                                  SizedBox(width: 8,),
                                  Expanded(
                                      child: Text(
                                        jsonDecode(data)["data"][index]["ADDRESS"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8,),
                                  Icon(Icons.call),
                                  SizedBox(width: 8,),
                                  Expanded(
                                      child: Text(
                                        jsonDecode(data!)["data"][index]["PHONE_NO"],
                                        style: TextStyle(
                                            fontSize: 16,
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
                                                  Servicespage(hospitalAddress: jsonDecode(data!)["data"][index]["ADDRESS"] ,
                                                      hospitalId:jsonDecode(data!)["data"][index]["H_ID"] ,
                                                      hospitalImage:"https://ehealthub.000webhostapp.com/API/" + jsonDecode(data!)["data"][index]["H_IMG"] ,
                                                      hospitalName:jsonDecode(data!)["data"][index]["H_NAME"]
                                            )));
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
              itemCount: hospitaldata.length,
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
