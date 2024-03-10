import 'dart:convert';
import 'dart:io';

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
    http.MultipartRequest('POST', Uri.parse("https://e-healthhub.000webhostapp.com/API/hospitalupdate.php"));

    final file = await http.MultipartFile.fromPath('H_IMG', fileImage.path,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));

    imageUploadRequest.fields['D_NAME']= "Mrs.Doctor";
    imageUploadRequest.fields['H_ID'] = "1";
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

      body: _isLoading ? Center(child: CircularProgressIndicator(color: Colors.greenAccent)) :
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
             child: Column(
               children: [
                 SizedBox(
                   height: 5,
                 ),
                 TextFormField(
                   controller: hospitalNameController,
                   decoration: InputDecoration(

                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                     hintText:"Enter Hospital Name",
                   ),
                   style: TextStyle(color: Colors.black),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: addressController,
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
                   controller: passwordController,
                   decoration: InputDecoration(
                 suffixIcon: Icon(Icons.remove_red_eye),
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                     hintText:"password",
                   ),
                   style: TextStyle(color: Colors.black),
                 ),

                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: phoneNoController,
                   decoration: InputDecoration(

                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                     hintText:"phone",
                   ),
                   style: TextStyle(color: Colors.black),
                 ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [

                   Text("Upload Hospital Photo",style: TextStyle(fontSize: 20),),
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
                 SizedBox(
                   height: 30,
                 ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    TextButton(onPressed: _submit,
                    child: Text("Edit",style: TextStyle(color:Colors.white,fontSize: 25),),style: ButtonStyle(
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