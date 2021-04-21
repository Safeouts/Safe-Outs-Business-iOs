import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:safeouts_business/screens/StaffLogin.dart';


class StaffPin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                ),
                Text('BUSINESS',style: TextStyle(
                    fontSize: 16.0
                ),
                ),
                SizedBox(height: 28.0),
                Text('Enter Your Pin',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: PinEntryTextField(
                      showFieldAsBox: true,
                      fields: 4,
                    )
                ),
                SizedBox(height: 20.0,),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    child: Text('Submit'),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => StaffLogin()
                          )
                      );
                    },
                    color: Colors.teal.withOpacity(0.7),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}