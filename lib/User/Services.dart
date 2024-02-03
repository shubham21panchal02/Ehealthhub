import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Servicespage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Service();
  }
}

class Service extends State<Servicespage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarcolor,
          title: Text("Services"),
        ),
        body: SingleChildScrollView(
            child: Column(
            children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){},
                  child: Card(margin: EdgeInsets.all(10),color: ColorConstants.lightcolor,
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScMRJK34Xds1Wsbg13IYRGQ2vvYaJ1KvQRg97vCj1U1rDO6DObf7ztbxfOLLTYu97rFAg&usqp=CAU",height: 200,),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text("Specialist:",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),

                            Text(
                              "ENT",
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
                            Text("Fees:",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Icon(Icons.currency_rupee),

                            Text(
                              "300",
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
                            Text("Rewards Point:",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Icon(Icons.currency_exchange,color: Colors.yellow,),

                            Text(
                              "300",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Center(
                        //   child:  ElevatedButton(onPressed: (){
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => Uforthpage(),));
                        //   }, child:Text("Book Appointment"),
                        //     style:ElevatedButton.styleFrom(primary: Color(0xFF0e9096),shape: RoundedRectangleBorder(
                        //         borderRadius:BorderRadius.all(Radius.circular(20))
                        //     )),),)
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
