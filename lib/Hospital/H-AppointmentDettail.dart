import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Colour.dart';

class  Adetailpage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ad();
  }

}
class ad extends State<Adetailpage> with TickerProviderStateMixin{

  @override

  Widget build(BuildContext context) {

    // TODO: implement build
     return Scaffold(
         appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
           title: const Text('Appointment Detail'),
         ),


       body:


                   Container(


 child:Container(



decoration: BoxDecoration(

),


      child:Container(child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),

             ),
          child: Column(children:[


          ListView.builder(


          shrinkWrap: true,
          itemCount: 5,
           physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext Context,int index){

          return Card(
     margin: EdgeInsets.all(15),



shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: BorderSide(
    color: Colors.grey.shade200,

  )
),
            elevation: 10,






            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [

               Row(

                 children: [
                       Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: CircleAvatar(

                           backgroundImage: AssetImage('assets/image/d.jpg',
                             ),
                           radius: 30,

                         ),
                       ),

                   Text("Patient name: "),
                   Text("Dhruv Panchal",style: TextStyle( fontWeight: FontWeight.bold),),

                 ],
               ),

               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Fees: "),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("5000",style: TextStyle( fontWeight: FontWeight.bold),),
                   ),

                 ],
               ),
                Divider(
                  height: .5,
                  color: Colors.black,
                ),
                Container(
                /* decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [

                     ]
                   )
               ),  */
                  child: Column(
                    children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextButton(onPressed: (){}, child: Text("Accept",style: TextStyle(fontSize: 15),),  style: TextButton.styleFrom(
                            foregroundColor:Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.white,elevation: 10
                        ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextButton(onPressed: (){}, child: Text("Reject",style: TextStyle(fontSize: 15),),  style: TextButton.styleFrom(
                            foregroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            backgroundColor: Colors.white,elevation: 10
                        ),),
                      ),
                    ],
                  ),


                ],


                )
                )
]
                      )
          );
          },
          ),


        ])),
      )

        ),

    ),



                   )


    );
  }

}