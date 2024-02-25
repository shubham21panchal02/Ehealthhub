import 'package:devloperproject1/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Hospital/Registration.dart';

class option extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return optionstate();
  }
}
class optionstate extends State<option>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey,
              Colors.greenAccent.shade100
            ]
          )
        ),
  alignment: Alignment.center,
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Registerpage(),));
              },
              child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                              color: Colors.grey,
                              width: 1
                          )
                      ),

                  child: Card(

                    elevation: 20,
                    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),

      ),
                    clipBehavior:Clip.antiAlias ,
                    child: Column(
                      children: [
                        Image.asset('assets/image/uoption.jpg',
                              width: 300,fit: BoxFit.cover,),

                        Text("USER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

                      ],
                    ),
                  ),

              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Rpage(),));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1
                  )
                ),

                  child: Card(elevation: 20,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
    ),
                    clipBehavior:Clip.antiAlias ,
                    child: Column(
                      children: [
                        Image.asset('assets/image/hoption.jpg'
                          ,width: 300,height: 300,fit: BoxFit.fill
                          ,),
                        Text("HOSPITAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

                      ],
                    ),
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }

}