import 'package:devloperproject1/User/Fourthpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class Uthiredpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Thiredpage();
  }
}

class Thiredpage extends State<Uthiredpage>{
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: Text("Book Appointment",),
      ),
      body:SingleChildScrollView(
        child: (
        Column(
          children: [
          Card(margin: EdgeInsets.all(10),
          elevation: 10,
          color: ColorConstants.lightcolor,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("https://sys.mediflam.com/OfflineUploads/HospitalImage/Sterling_Hospital.JPG",),
                Row(children: [
                  Image.asset('assets/image/hospital.png',
                  width: 35,),
                  Text(
                    "  Sterling Hospital",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],),
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
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Image.asset('assets/image/doctor.jpg',
                    width:35),
                   Expanded(child: Text("Dr.Panchal Dhruv",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Specialist:",style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    Expanded(child: Text("ENT",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fees:",style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    Icon(Icons.currency_rupee),
                    Expanded(child: Text("500",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                      const SizedBox(height: 20.0,),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorConstants.buttonscolor
                        ),
                        onPressed: () => _selectDate(context),
                        child: const Text('Select date'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
    Center(child:
    ElevatedButton(onPressed: () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Book Appointment Successfully!',
        autoCloseDuration: const Duration(seconds: 5),

        showConfirmBtn: false,
      );
    },
        child: Padding(padding: EdgeInsets.only(top: 20,bottom: 10,left: 100,right: 100),
      child: Text("Book Now",),
        )),),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          ),
          ],
        )
        ),
      )

    );

  }

  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}


