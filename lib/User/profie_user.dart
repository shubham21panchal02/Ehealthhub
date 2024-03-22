import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/Colour.dart';
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
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      userNameController = TextEditingController(text:setpreference.getString('name')!);
      ageController = TextEditingController(text:setpreference.getString('age')!);
      emailController = TextEditingController(text: setpreference.getString('email')!);
      passwordController = TextEditingController(text: setpreference.getString('password')!);
      genderController = TextEditingController(text: setpreference.getString('gender')!);
      addressController = TextEditingController(text: setpreference.getString('address')!);
      bloodgroupController = TextEditingController(text: setpreference.getString('blood_group')!);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: Text("Edit Profile",),
      ),
      body: isLoading ? Center(child: LoadingAnimationWidget.discreteCircle(color: ColorConstants.drawercolor, size: 30)
      ): SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
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
                                  suffixIcon: Icon(Icons.account_circle,color: ColorConstants.appbarcolor,),
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
                                    icon: Icon(Icons.date_range,color: ColorConstants.appbarcolor,),),
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
                                  suffixIcon: Icon(Icons.email,color: ColorConstants.appbarcolor,),
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
                                      color: ColorConstants.appbarcolor,
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
                                  suffixIcon: Icon(Icons.person,color: ColorConstants.appbarcolor,),
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
                                  suffixIcon: Icon(Icons.location_on,color: ColorConstants.appbarcolor,),
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
                                  suffixIcon: Icon(Icons.bloodtype,color:ColorConstants.appbarcolor,),
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
                    color: ColorConstants.appbarcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    // decoration: BoxDecoration(
                    // ),
                    child: Center(
                      child: Text("Update", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    ),
                  )),



                ],
              ),
            ),
          ),
        ),
      ),
    );
   }
  Future<void> _submit() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    final form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://e-healthhub.000webhostapp.com/API/userupdate.php");
      final response = await http
          .post(login_url, body: {
        "U_ID": setpreference.getString('id'),
        "U_NAME": userNameController.text,
        "EMAIL_ID": emailController.text,
        "PASSWORD": passwordController.text,
        "AGE": ageController.text,
        "ADDRESS": addressController.text,
      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
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
          setpreference.setString('name', userNameController.text);
          setpreference.setString('email', emailController.text);
          setpreference.setString('password',  passwordController.text);
          setpreference.setString('age',  ageController.text);
          setpreference.setString('gender', genderController.text);
          setpreference.setString('blood_group',  bloodgroupController.text);
          setpreference.setString('address',  addressController.text);
          Navigator.of(context).pop();
        }else{
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