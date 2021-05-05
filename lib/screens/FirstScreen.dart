import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safeouts_business/home.dart';
import 'package:safeouts_business/screens/AdminLogin.dart';
import 'package:safeouts_business/screens/NewAdmin.dart';
import 'package:safeouts_business/screens/StaffPin.dart';


class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    String userData() {
      // final User user = auth.currentUser;
      // final uid = user.uid;
      // return uid;
    }
    // TODO: implement build
    return Scaffold(
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Text('BUSINESS'),
              SizedBox(height: 60),
              SizedBox(
                width: 300,
                height: 60,
                child: RaisedButton(
                  child: Text('Login as Admin'),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  textColor: Colors.white,
                  onPressed: () {
                    if(userData()!=null){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyStatefulWidget()
                          )
                      );
                    }
                    else{
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => AdminLogin()
                          )
                      );
                    }
                  },
                  color: Colors.teal.withOpacity(0.7),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 60,
                child: RaisedButton(
                  child: Text('New Admin'),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => NewAdmin()
                        )
                    );
                  },
                  color: Colors.teal.withOpacity(0.7),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 60,
                child: RaisedButton(
                  child: Text('Login as Staff'),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => StaffPin()
                        )
                    );
                  },
                  color: Colors.teal.withOpacity(0.7),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
              ),
            ],
          )
      ),
    );
  }

}