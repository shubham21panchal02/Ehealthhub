import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/User/Thiredpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class Servicespage extends StatefulWidget {
  final String hospitalId;
  final String hospitalImage;
  final String hospitalName;
  final String hospitalAddress;

  Servicespage({required this.hospitalAddress,required this.hospitalName,required this.hospitalId,
    required this.hospitalImage});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Service();
  }
}

class Service extends State<Servicespage> {
  String data="";
  var servicedata;
  bool isLoading=true;

  void initState() {
    super.initState();
    getData("servicedata");
  }
  Future<void> getData(String category) async {
    setState(() {
      isLoading=true;
    });
    http.Response response =
    await http.get(
      Uri.parse("https://ehealthub.000webhostapp.com/API/servicefetch.php"),);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        servicedata = jsonDecode(data!)["data"];
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
          backgroundColor: ColorConstants.appbarcolor,
          title: Text("Services"),
        ),
        body:  isLoading ? Center(child: LoadingAnimationWidget.discreteCircle(color: ColorConstants.drawercolor, size: 30)
        ): SingleChildScrollView(
            child: Column(
            children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index)  {
                return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Uthiredpage(
                      hospitalAddress: widget.hospitalAddress,
                      hospitalId:widget.hospitalId ,
                      hospitalImage:widget.hospitalImage ,
                      hospitalName:widget.hospitalName,
                    Speciallist: jsonDecode(data!)["data"][index]["SPECIALIST"],
                    fees: jsonDecode(data!)["data"][index]["FEES"],
                  ),));
                    },
                  child: Card(margin: EdgeInsets.all(10),color: ColorConstants.lightcolor,
                    elevation: 5,
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
                            image: NetworkImage(
                                "https://ehealthub.000webhostapp.com/API/" + jsonDecode(data)["data"][index]["S_IMG"]),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            Text("Specialist: ",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                            Text(
                              jsonDecode(data!)["data"][index]["SPECIALIST"],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            Text("Fees: ",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Icon(Icons.currency_rupee),
                            Text(
                                jsonDecode(data)["data"][index]["FEES"],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        )));
  }
}
