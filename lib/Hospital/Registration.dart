import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:devloperproject1/Login.dart';
import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Rpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginstate();
  }
}
class Loginstate extends State<Rpage> {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  final formKey = new GlobalKey<FormState>();
  bool _isLoading = false;
  var logindata;
  var data;

  final ImagePicker _picker = ImagePicker();
  File? _image;
  Future _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  uploadImageMedia(File fileImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mimeTypeData =
    lookupMimeType(fileImage.path, headerBytes: [0xFF, 0xD8])?.split('/');
    final imageUploadRequest =
    http.MultipartRequest('POST', Uri.parse("https://e-healthhub.000webhostapp.com/API/hregister.php"));

    final file = await http.MultipartFile.fromPath('H_IMG', fileImage.path,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));

    imageUploadRequest.fields['D_NAME']= "Mrs.Doctor";
    imageUploadRequest.fields['H_NAME']= hospitalNameController.text;
    imageUploadRequest.fields['PHONE_NO']= phoneNoController.text ;
    imageUploadRequest.fields['EMAIL_ID']= emailController.text ;
    imageUploadRequest.fields['ADDRESS']= addressController.text ;
    imageUploadRequest.fields['PASSWORD']= passwordController.text ;
    imageUploadRequest.files.add(file);
    try {
      _isLoading = true;

      final streamedResponse = await imageUploadRequest.send();

      streamedResponse.stream.transform(utf8.decoder).listen((value) {
        if(streamedResponse.statusCode==200){
          setState(() {
            _isLoading=false;
          });
          logindata = jsonDecode(value);
          if (logindata['error'] == false) {
            Fluttertoast.showToast(
                msg: logindata['message'].toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2
            );
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
                (BuildContext context) => Loginpage()), (Route<dynamic> route) => false);
          }else{
            Fluttertoast.showToast(
                msg: logindata['message'].toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2
            );
          }
          Fluttertoast.showToast(
              msg: "Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          //     builder: (BuildContext context) => DoctorHomePage()), (
          //     Route<dynamic> route) => false);
          print(streamedResponse.stream);
          print(value);
        }else{
          setState(() {
            _isLoading=false;
          });
          Fluttertoast.showToast(
              msg: "Something went wrong",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          print(value);
        }
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator(color: Colors.greenAccent)) :

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
            key: formKey,
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
                                              controller: hospitalNameController,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(

                                                  hintText: "Hospital Name",
                                                  suffixIcon: Icon(Icons.local_hospital,color: Colors.blue,),
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
                                              obscureText: true,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                  suffixIcon: Icon(Icons.remove_red_eye,color: Colors.blue,),
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
                                              controller: phoneNoController,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                  suffixIcon: Icon(Icons.phone,color: Colors.blue,),
                                                  hintText: "PHONE_NO",
                                                  hintStyle: TextStyle(color: Colors.black),
                                                  border: InputBorder.none
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:20 ,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("Upload Hospital Photo",style: TextStyle(fontSize: 10,color: Colors.black),),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                TextButton(onPressed: _getImage, child: Text("Upload Photo",style: TextStyle(fontSize: 20),),style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),

                                                    elevation: MaterialStateProperty.all(15),
                                                    shape: MaterialStateProperty.all(

                                                        RoundedRectangleBorder(
                                                            side: BorderSide.none,
                                                            borderRadius: BorderRadius.circular(20)
                                                        )
                                                    )
                                                ),
                                                )
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),



                                SizedBox(height: 40,),
                                FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Forgot Password?", style: TextStyle(color: Colors.black),)),
                                SizedBox(height: 40,),
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

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      if(_image != null){
        setState(() {
          _isLoading = true;
        });
        uploadImageMedia(_image!);
      }else{
        Fluttertoast.showToast(
            msg: "Please select image",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
      }

    }

  }

}