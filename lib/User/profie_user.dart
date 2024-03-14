import 'dart:convert';

import 'package:devloperproject1/User/Firstpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
class user_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return p();
  }

}
class p extends State<user_profile> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SingleChildScrollView(
        child:
        Column(
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
                          controller: userNameController,
                          validator: (val) {
                if (val!.isEmpty ||
                RegExp(r"\s").hasMatch(val)) {
                return "Enter User Name ";
                }
                },
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
                          controller: addressController,
                          validator: (val) {
                if (val!.isEmpty ||
                RegExp(r"\s").hasMatch(val)) {
                return "Enter User address ";
                }
                },
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
                          controller: emailController,
                          validator:  (val) {
    if (val!.isEmpty ||
    RegExp(r"\s").hasMatch(val)) {
    return "Enter User email ";
    }
    },
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
                          controller: passwordController,
                          validator:(val) {
                            if (val!.isEmpty ||
                                RegExp(r"\s").hasMatch(val)) {
                              return "Enter User password ";
                            }
                          },

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
                          controller: addressController,
                          validator: (val) {
                            if (val!.isEmpty ||
                                RegExp(r"\s").hasMatch(val)) {
                              return "Enter User age";
                            }
                          },
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


                              ElevatedButton(onPressed: (){_submit();

                              }, child: Text("Edit",style: TextStyle(color:Colors.white,fontSize: 25),),style: ButtonStyle(
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
  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://e-healthhub.000webhostapp.com/API/userupdate.php");

      final response = await http
          .post(login_url, body: {
        "PASSWORD": passwordController.text,
        "U_NAME": userNameController.text,
        "AGE": ageController.text,
        "ADDRESS": addressController.text,
        "Role": "1",

      });
      if (response.statusCode == 200) {
        print("object");
        logindata = jsonDecode(response.body);
        data =
        jsonDecode(response.body)['user'];
        print(logindata);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Ufirstpage()),
                  (route) => false);
        }
        else{
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
        }
      }

    }
  }
}