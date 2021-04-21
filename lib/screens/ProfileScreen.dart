import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:safeouts_business/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}
class Profile extends StatefulWidget {

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<Profile> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;


  File imageFile;//take file path
  File _profileImageFile;

  Future<void> _pickImage() async {
    final selected = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _profileImageFile = File(selected.path);
    });
  }
  void _clear() {
    setState(() {
      _profileImageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          child: SingleChildScrollView(

            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(
                    height: 10,
                    thickness:10),
            SizedBox(
                  height: 10,
                ),
                    _profileImageFile != null
                        ? Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                              Text('                                                               Update logo',
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,   fontSize: 17,
                              ),
                              textAlign: TextAlign.left,
                            ),
                               FlatButton(
                                 child:Text('                                                             Remove logo',
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,   fontSize: 17,
                              ),
                            ),
                                 onPressed: _clear,
                               ),
                          ],
                        ),
                      ],
                    )

                        : GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topLeft,
                            child:
                            Image.asset(
                                  "assets/images/reslogo.png",
                                  width: 100,
                                  height: 50,
                                ),
                              decoration: new BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              width: 100,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "Restaurant's name",
                      border: InputBorder.none,

                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,fontSize: 25,
                      ),
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),

                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                    },
                    decoration: InputDecoration(
                      hintText: "Restaurant's address",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    style: TextStyle(color: Colors.black54),

                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    hintText: 'Add phone no.',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold
                    ),
                  ),
                  style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                ),

                Container(
                    padding: EdgeInsets.only(right:140.0, left: 10),
                    child:
                    PinEntryTextField(
                      onSubmit: (String pin){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Pin"),
                                content: Text('Pin entered is $pin'),
                              );
                            }
                        ); //end showDialog()

                      }, // end onSubmit
                    ),
                    // PinEntryTextField(
                    //   showFieldAsBox: true,
                    //   fields: 4,
                    // )
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Text('Capacity no.pre-covid',
                          style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,   fontSize: 17,
                          ),
                        ),
                      ),

                      Expanded
                        (child:
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLines: null,
                        onChanged: (String value) {
                          // food.Pcop = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add values',
                          hintStyle: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold
                          ),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 30),
                        ),
                        style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),

                      )
                      ),
                    ]),

                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Text('Capacity no.after SOP',
                          style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,   fontSize: 17,

                          ),
                        ),
                      ),

                      Expanded(child: TextField(
                        keyboardType: TextInputType.number,
                        maxLines: null,
                        onChanged: (String value) {
                          // food.Pcop = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add values',
                          hintStyle: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold
                          ),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 30),
                        ),
                        style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),

                      )),
                    ]),
                SizedBox(
                  height: 1,
                ),
                Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Pictures',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,   fontSize: 20,

                          ),
                        ),
                      ),

                    ]),
                SizedBox(
                  height: 30,
                ),

                Column(

                  children: <Widget>[
                    FlatButton(
                      padding: const EdgeInsets.only(left: 150),
                      child: Icon(Icons.add,size: 50 ),
                      // onPressed: _pickImage,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 140),
                      child: Text('Tap to add images',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // Text('Tap to add images',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 390.0,
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Color(0x00fbbb)),
                    ),
                    color: Colors.teal.withOpacity(0.7),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    elevation: 0.0,
                    onPressed: () async {
                      _submit();
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => Home()
                      //     )
                      // );
                    },
                    child: Text('                  Save Changes                 ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Container(
                //   width: 510.0,
                //   height: 60.0,
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                //
                //   child: RaisedButton(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       side: BorderSide(color: Colors.white),
                //     ),
                //     color: Colors.teal.withOpacity(0.7),
                //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                //
                //     elevation: 0,
                //     onPressed: () async {
                //       // _showlogout();
                //     },
                //
                //     child: Text('Save Changes',
                //         style: TextStyle(
                //           fontSize: 20,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         )),
                //   ),
                // ),

                // SizedBox(
                //   width: 390,
                //   height: 60,
                //   child: RaisedButton(
                //     child: Text('Save changes'),
                //     elevation: 2,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(16.0))),
                //     textColor: Colors.white,
                //     onPressed: () {
                //       Navigator.of(context).pushReplacement(
                //           MaterialPageRoute(
                //               builder: (BuildContext context) => Home()
                //           )
                //       );
                //     },
                //     color: Colors.teal.withOpacity(0.7),
                //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                //   ),
                // )

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
  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }
}
class TextEditorForPhoneVerify extends StatelessWidget {
  final TextEditingController code;

  TextEditorForPhoneVerify(this.code);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: this.code,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            hintText: "*",
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)
        )
    );
  }
}