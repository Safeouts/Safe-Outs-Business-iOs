import 'package:flutter/material.dart';
class StaffHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
        title: Text(''),
      ),
      body:Center(
       child: Text("Yet to Implement Staff Home",
         style: TextStyle(
             fontSize: 20.0
         ),
       ),
      )
    );
  }

}