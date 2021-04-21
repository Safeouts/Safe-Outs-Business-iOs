import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safeouts_business/screens/SettingsPage.dart';

class EditProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<EditProfile> {
  String msg = "";
  String imagePath; //take image path picked from imagepicker
  String downloadURL;//download url from firbase
  String uid;//user id
  // Person user = Person();//person class object
  String gender = 'male';
  final _formkey = GlobalKey<FormState>();
  File imageFile;//take file path
  File _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),

      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Builder(
          builder: (context) => Form(
            key: _formkey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.white.withOpacity(.2),
                                offset: Offset(0, 10),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,


                              image: imageFile == null
                                  ?
                              NetworkImage(
                                  'https://clipground.com/images/person-icon-clipart-5.jpg')
                                  : FileImage(imageFile),
                            )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                icon: Icon(Icons.camera_alt, color: Colors.black),
                                onPressed: () {
                                  _openCameraOrGallery('');
                                }),
                          )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                  lable: 'Full Name',
                  hint: 'Enter Full Name',
                  error: 'Please Enter Full Name',
                  // controller: nameController,
                ),

                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                  // controller: emailController,

                  hint: 'Phone Number',
                  lable: 'Phone',
                  error: 'Please Enter phone number',
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Text(
                  //   // loc!=null? '${loc}':'',
                  //   // style: TextStyle(color: Colors.white,fontSize: 23,),
                  // ),
                ),

                Container(
                  width: 390.0,
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: Color(0x00fbbb)),
                    ),
                    color: Colors.teal.withOpacity(0.7),
                    elevation: 0,
                    onPressed: () async {
                      final form = _formkey.currentState;
                      if (form.validate()) {
                        storeUser();
                        // print('Person :${user.toString()}');
                        // await _addPerson(user);
                        moveTonextScreen();
                      }
                    },
                    child: Text('Save',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  _openCameraOrGallery(String param) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile =
    await imagePicker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    print("Image Path is $imageFile");
    setState(() {});
  }
  //Text form widget
  TextFormField buildTextFormField(
      {String lable, String hint, String error, dynamic controller}) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: lable,
        hintText: hint,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.teal[800]),
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.teal[800]),
          gapPadding: 10,
        ),
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.teal),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.teal),
          gapPadding: 10,
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return error;
        }
      },
      controller: controller,
    );
  }
  //move to next screen--succes

  moveTonextScreen() {
    Timer(
        Duration(seconds: 2),
            () => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SettingsPage()))
        });
  }

  storeUser() {
    // user.name = nameController.text;
    // user.dob = dobController.text;
    // user.email = emailController.text;
    // user.uid = uid;
    // user.picUrl = downloadURL == null
    //     ? 'https://clipground.com/images/person-icon-clipart-5.jpg'
    //     : downloadURL;
    // user.location = loc;
    // user.gender = gender;
    setState(() {});
  }
  //Assigning contoller to the text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  //adding user to cloud firebase
  // Future<String> _addPerson(Person user) async {
    // String str = await DbOperations.addPerson(user);
    // print(str);
    // return str;
  // }
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  void _showPicker(String param) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

