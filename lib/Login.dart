import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:devloperproject1/Optionbutton.dart';
import 'package:devloperproject1/Register.dart';
import 'package:devloperproject1/User/Firstpage.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Admin/Afristpage.dart';
import 'Hospital/Hfirstpage.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginstate();
  }
  }
 class Loginstate extends State<Loginpage>{

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   final formKey = new GlobalKey<FormState>();
   var logindata;
   bool _passwordVisible = false;
   var data;
   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:isLoading ? Center(child: CircularProgressIndicator(color: Colors.greenAccent)) :
      SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child:Column(
          children: [
            SizedBox(height: 50),
            FadeInUp(child:
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/Login page.jpg'),fit: BoxFit.cover,
                ),
            ),),
            ),SizedBox(
              height: 30,
            ),
            Form(
            key: formKey,child:
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
                      controller: emailController,
                      validator:  (val) {
                        if (val!.isEmpty ||
                            RegExp(r"\s").hasMatch(val)) {
                          return "Use Proper Email ID ";
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(

                          hintText: "Enter Your Email_ID",
                          suffixIcon: Icon(Icons.email,color: Colors.blue,),
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
                    controller: passwordController,
                    validator:  (val) {
                      if (val!.isEmpty ||
                          RegExp(r"\s").hasMatch(val)) {
                        return "Use Proper Password ";
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon:  IconButton(onPressed: (){
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
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                    ),
                  ),),
                          SizedBox(height: 40,),
                          FadeInUp(duration: Duration(milliseconds: 1500),
                              child: Text("Don't have an account?",
                                style: TextStyle(color: Colors.black),),

                          ),
                          FadeInUp(duration: Duration(milliseconds: 1500),
                              child: TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => option(),));
                              }, child: Text("sign up")),),
                          SizedBox(height: 10,),
                          FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                            onPressed: _submit,
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: ColorConstants.buttonscolor,
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
        )
    ),
    )])
        )
        ))
    )]
      )
    )
    );
  }

   Future<void> _submit() async {
     final form = formKey.currentState;
     if (form!.validate()) {
       setState(() {
         isLoading = true;
       });
       final login_url = Uri.parse(
           "https://e-healthhub.000webhostapp.com/API/login.php");
       final response = await http
           .post(login_url, body: {
         "EMAIL_ID": emailController.text,
         "PASSWORD": passwordController.text
       });
       if (response.statusCode == 200) {
         logindata = jsonDecode(response.body);
         data =
         jsonDecode(response.body)['user'];
         print(data);
         setState(() {
           isLoading = false;
         });
           if (logindata['error'] == false) {
             SharedPreferences setpre = await SharedPreferences.getInstance();
             setpre.setString('id',data['U_ID'].toString());
             setpre.setString('name',data['U_NAME'].toString());
             setpre.setString('email',data['E_MAIL'].toString());
             setpre.setString('password',data['PASSWORD'].toString());
             setpre.setString('role',data['ROLE'].toString());
             var temp_role = setpre.getString('id').toString();

             print(temp_role);
             print("ROLE ");
             print( data['ROLE'].toString());

               if(setpre.getString('ROLE').toString() == "0")
                 {
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Afristpage(),), (route) => false);
                 }
            else if(setpre.getString('ROLE').toString() == "1")
             {
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Ufirstpage(),), (route) => false);
             }
             else
               {
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => h_firstpage(),), (route) => false);
               }

               } else {
                 Fluttertoast.showToast(
                     msg: logindata['message'].toString(),
                     toastLength: Toast.LENGTH_LONG,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 2
                 );
               }
             }
           }
         }}
