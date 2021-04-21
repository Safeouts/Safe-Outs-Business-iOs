import 'package:flutter/material.dart';
import 'dart:async';

import 'package:safeouts_business/screens/FirstScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          } else {
            // _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => FirstScreen()
      )
    );
  }

  // void _navigateToLogin(){
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => Profile()
  //       )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
              child: Image.asset(
                    "assets/images/logo.gif",
                )
              ),
    );
  }
}