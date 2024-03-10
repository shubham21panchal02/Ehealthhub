import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class user_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return p();
  }

}
class p extends State<user_profile>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(

                    height: 100,
                    width: double.infinity,
                    child:Padding(padding:EdgeInsets.only(),child: Lottie.asset('assets/image/h-Appointment.json',fit: BoxFit.cover))
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250,left: 10),
                  child: Text("ADD PROFILE",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            SizedBox(height: 1,),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                color: Colors.white,


                child: Container(

                  child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                            hintText:"Enter patient Name",
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                            hintText:"address",
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                            hintText:"email",
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                            hintText:"Password",
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                            hintText:"Age",
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),


                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


                              TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color:Colors.white,fontSize: 25),),style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),

                                  elevation: MaterialStateProperty.all(15),
                                  shape: MaterialStateProperty.all(

                                      RoundedRectangleBorder(
                                          side: BorderSide.none,
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  )
                              ),
                              ),
                            ],
                          ),
                        )]
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
   }

}