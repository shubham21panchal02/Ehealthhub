import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';

class Registerpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Registerstate();
  }
}
class Registerstate extends State<Registerpage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;
  bool _passwordVisible = false;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body:

      SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics
          (),
        scrollDirection: Axis.vertical,
        child: Column(

            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: AssetImage('assets/image/Firstpage.jpg'),fit: BoxFit.cover,
                  ),

                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 120,),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Register", style: TextStyle(color: Colors.transparent, fontSize: 20),)),
                              SizedBox(height: 10,),
                              FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Welcome Hospital", style: TextStyle(color: Colors.transparent,fontWeight: FontWeight.bold, fontSize: 18),)),
                            ],
                          ),
                        ),]),),),


              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(duration: Duration(milliseconds: 1400),
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),


                                )]
                            ),
                            child: Column(
                              children: <Widget>[

                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: userNameController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter User Name ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        hintText: "User Name",
                                        suffixIcon: Icon(Icons.account_circle,color: Colors.blue,),
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: ageController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter Your Age ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        hintText: "Age",
                                        suffixIcon: IconButton(onPressed: (){

                                        },
                                          icon: Icon(Icons.date_range),),
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),

                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),

                                  child: TextFormField(
                                    controller: emailController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter email ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.email,color: Colors.blue,),
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),SizedBox(
                                  height: 7,
                                ),
                                Container(

                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter password ";
                                      }
                                    },
                                    obscureText: !_passwordVisible,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(onPressed: (){
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context).primaryColorDark,
                                          ),),
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: genderController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter Your Gender ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        hintText: "Gender",
                                        suffixIcon: Icon(Icons.person,color: Colors.blue,),
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: addressController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter Address ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        hintText: "Address",
                                        suffixIcon: Icon(Icons.location_on,color: Colors.blue,),
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: bloodgroupController,
                                    validator:  (val) {
                                      if (val!.isEmpty ||
                                          RegExp(r"\s").hasMatch(val)) {
                                        return "Enter Your Bloodgroup ";
                                      }
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        hintText: "Blood Group",
                                        suffixIcon: Icon(Icons.bloodtype,color: Colors.blue,),
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                          onPressed: _submit,
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          color: Colors.greenAccent.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),

                          ),
                          // decoration: BoxDecoration(
                          // ),
                          child: Center(
                            child: Text("Sign In", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                        )),



                      ],
                    ),
                  ),
                ),
              ),

            ]),
      )
    );
}

Future<void> _submit() async {
  final form = _formKey.currentState;
  if (form!.validate()) {
    setState(() {
      isLoading = true;
    });
    final login_url = Uri.parse(
        "https://e-healthhub.000webhostapp.com/API/register.php");

    final response = await http
        .post(login_url, body: {
      "EMAIL_ID": emailController.text,
      "PASSWORD": passwordController.text,
      "U_NAME": userNameController.text,
      "AGE": ageController.text,
      "GENDER": genderController.text,
      "BLOOD_GROUP": bloodgroupController.text,
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
            MaterialPageRoute(builder: (context) => Loginpage()),
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