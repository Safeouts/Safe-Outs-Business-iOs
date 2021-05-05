import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safeouts_business/screens/StaffOtp.dart';

class StaffLogin extends StatelessWidget{
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 300,
                  ),
                  Text('BUSINESS',style: TextStyle(
                      fontSize: 20.0
                  ),
                  ),
                  SizedBox(height: 28.0),
                  // width: double.infinity,
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  bottomLeft: Radius.circular(14.0)
                              )
                          ),
                          child: Center(
                            child: Text("+91",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          constraints: const BoxConstraints(
                              maxWidth: 300
                          ),
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14.0),
                                  bottomRight: Radius.circular(14.0)
                              ),
                            ),
                            controller: phoneController,
                            clearButtonMode: OverlayVisibilityMode.editing,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            placeholder: 'Enter phone number with country code...',
                          ),
                        ),

                      ],
                    ),

                  ),
                  SizedBox(height: 30.0,),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: RaisedButton(
                      child: Text('Login'),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) => StaffOtp()
                            )
                        );
                      },
                      color: Colors.teal.withOpacity(0.7),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

}