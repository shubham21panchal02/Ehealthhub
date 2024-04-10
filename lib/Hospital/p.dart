import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Widgets/Colour.dart';
import 'Hfirstpage.dart';

class p extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return profilescreen();
  }

}
class profilescreen extends State<p>{


  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  final formKey = new GlobalKey<FormState>();
  bool _passwordVisible = false;
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

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      hospitalNameController = TextEditingController(text:setpreference.getString('name')!);
      emailController = TextEditingController(text: setpreference.getString('email')!);
      passwordController = TextEditingController(text: setpreference.getString('password')!);
      addressController = TextEditingController(text: setpreference.getString('address')!);
      phoneNoController = TextEditingController(text: setpreference.getString('phone')!);
    });
  }

  uploadImageMedia(File fileImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mimeTypeData =
    lookupMimeType(fileImage.path, headerBytes: [0xFF, 0xD8])?.split('/');
    final imageUploadRequest =
    http.MultipartRequest('POST', Uri.parse("https://ehealthub.000webhostapp.com/API/hospitalupdate.php"));

    final file = await http.MultipartFile.fromPath('H_IMG', fileImage.path,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));

    imageUploadRequest.fields['D_NAME']= "Mrs.Doctor";
    imageUploadRequest.fields['H_ID'] = prefs.getString('id')!;
    imageUploadRequest.fields['H_NAME']= hospitalNameController.text;
    imageUploadRequest.fields['PHONE_NO']= phoneNoController.text ;
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
            prefs.setString('name', hospitalNameController.text);
            prefs.setString('email', emailController.text);
            prefs.setString('phone', phoneNoController.text);
            prefs.setString('password', passwordController.text);
            prefs.setString('address', addressController.text);

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
                (BuildContext context) => h_firstpage()), (Route<dynamic> route) => false);
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
    return Scaffold(

      appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
        title: const Text(' Edit Profile '),
      ),

      body: _isLoading ? Center(child: CircularProgressIndicator(color: ColorConstants.appbarcolor)) :
       SingleChildScrollView(
      child: Column(
  children: [
    Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            height: 100,
                width: double.infinity,
          child:Padding(padding:EdgeInsets.only(),child: Lottie.asset('assets/image/h-Appointment.json',fit: BoxFit.cover))
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 250,left:40 ),
        child: Text("Edit PROFILE",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
      )
      ],
    ),
    SizedBox(height: 1,),
    SingleChildScrollView(
  physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),child:Container(
        color: Colors.white,


        child:
           Container(

           child: Form(
             key: formKey,
             child:  Column(

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
                             validator:  (val) {
                               if (val!.isEmpty) {
                                 return "Enter Hospital Name ";
                               }
                             },
                             style: TextStyle(color: Colors.black),
                             decoration: InputDecoration(

                                 hintText: "Hospital Name",
                                 suffixIcon: Icon(Icons.local_hospital,color: ColorConstants.appbarcolor,),
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
                                 suffixIcon: Icon(Icons.email,color:ColorConstants.appbarcolor,),
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
                             obscureText: !_passwordVisible,
                             validator:  (val) {
                               if (val!.isEmpty ||
                                   RegExp(r"\s").hasMatch(val)) {
                                 return "Enter password ";
                               }
                             },
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
                             controller: addressController,

                             validator:  (val) {
                               if (val!.isEmpty) {
                                 return "Enter address ";
                               }
                             },
                             style: TextStyle(color: Colors.black),
                             decoration: InputDecoration(
                                 suffixIcon: Icon(Icons.location_on,color: ColorConstants.appbarcolor,),
                                 hintText: "Address",
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
                             validator:  (val) {
                               if (val!.isEmpty ||
                                   RegExp(r"\s").hasMatch(val)) {
                                 return "Enter Phone No ";
                               }
                             },
                             style: TextStyle(color: Colors.black),
                             decoration: InputDecoration(
                                 suffixIcon: Icon(Icons.phone,color: ColorConstants.appbarcolor,),
                                 hintText: "PHONE_NO",
                                 hintStyle: TextStyle(color: Colors.black),
                                 border: InputBorder.none
                             ),
                           ),
                         ),
                         SizedBox(
                           height:20 ,
                         ),
                         // SingleChildScrollView(
                         //   scrollDirection: Axis.horizontal,
                         //   child: Row(
                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         //     children: [
                         //
                         //       Text("Upload Hospital Photo",style: TextStyle(fontSize: 10,color: Colors.black),),
                         //       SizedBox(
                         //         width: 10,
                         //       ),
                         //       TextButton(onPressed: _getImage, child: Text("Upload Photo",style: TextStyle(fontSize: 20),),style: ButtonStyle(
                         //           backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                         //
                         //           elevation: MaterialStateProperty.all(15),
                         //           shape: MaterialStateProperty.all(
                         //
                         //               RoundedRectangleBorder(
                         //                   side: BorderSide.none,
                         //                   borderRadius: BorderRadius.circular(20)
                         //               )
                         //           )
                         //       ),
                         //       )
                         //     ],
                         //   ),
                         // ),

                       ],
                     ),
                   ),
                 ),

                 SizedBox(height: 20,),
                 FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                   onPressed: _submit,
                   height: 50,
                   // margin: EdgeInsets.symmetric(horizontal: 50),
                   color:ColorConstants.appbarcolor,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(50),

                   ),
                   // decoration: BoxDecoration(
                   // ),
                   child: Center(
                     child: Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                   ),
                 )),



               ],
             ),
           ),
          ),
        ),
      ),
    )
  ],

      ),
      ),
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
        _upate();
      }

    }

  }

  Future<void> _upate() async {
    var logindata;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final login_url = Uri.parse(
          "https://ehealthub.000webhostapp.com/API/hospitalupdate.php");
      final response = await http
          .post(login_url, body: {
        "H_ID": prefs.getString('id'),
        "D_NAME": "Mrs.Doctor",
        "H_NAME": hospitalNameController.text,
        "EMAIL_ID": emailController.text,
        "PASSWORD": passwordController.text,
        "PHONE_NO": phoneNoController.text,
        "ADDRESS": addressController.text,
      });
      if (response.statusCode == 200) {
        print(response.body);
        logindata = jsonDecode(response.body);
        setState(() {
          _isLoading = false;
        });
        if (logindata['error'] == false) {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          prefs.setString('name', hospitalNameController.text);
          prefs.setString('email', emailController.text);
          prefs.setString('phone', phoneNoController.text);
          prefs.setString('password', passwordController.text);
          prefs.setString('address', addressController.text);

          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
              (BuildContext context) => h_firstpage()), (Route<dynamic> route) => false);
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