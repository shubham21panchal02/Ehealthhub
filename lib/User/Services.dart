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
                  child: Card(margin: EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Row(children: [Expanded(
                            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScMRJK34Xds1Wsbg13IYRGQ2vvYaJ1KvQRg97vCj1U1rDO6DObf7ztbxfOLLTYu97rFAg&usqp=CAU",height: 200,),),
                          ],),
                        Center(
                          child:Text("ENT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
                        )
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
