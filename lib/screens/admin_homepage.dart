import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safeouts_business/models/product.dart';
import 'package:safeouts_business/providers/product_provider.dart';



class Home extends StatefulWidget {
  final Product product;

  Home([this.product]);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Home> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final RnameController = TextEditingController();
  final RaddressController = TextEditingController();
  final RphoneController = TextEditingController();
  final RcopController = TextEditingController();
  final RsopController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();

    RnameController.dispose();
    RaddressController.dispose();
    RphoneController.dispose();
    RcopController.dispose();
    RsopController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    if (widget.product == null) {
      //New Record
      nameController.text = "";
      priceController.text = "";

      RnameController.text = "";
      RaddressController.text = "";
      RphoneController.text = "";
      RsopController.text = "";
      RcopController.text = "";

      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.loadValues(Product());
      });
    } else {
      //Controller Update
      RnameController.text=widget.product.name;
      RaddressController.text=widget.product.address;
      RphoneController.text=widget.product.phone.toString();
      RcopController.text=widget.product.cop.toString();
      RsopController.text=widget.product.sop.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.loadValues(widget.product);
      });

    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top:10,left: 20),
                    child: Text(
                        "Restaurant Name",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                  ),
                  SizedBox(width: 40,),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: 60),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top:10,left: 20),
              child: Text(
                  "Restaurant Address",
                  style: TextStyle(
                    fontSize: 17,
                  )
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40),
              child: Text(
                  "Real time Occupancy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:30),
              child: Text(
                  "17",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
                height: 2,
                thickness:2,
            ),
            SizedBox(
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top:10,left: 20),
                    child: Column(
                       children: <Widget>[
                         Container(
                           alignment: Alignment.topLeft,
                           child: Text(
                             "Capacity % pre-covid",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 17,
                             ),
                           ),
                         ),
                         Container(
                           alignment: Alignment.center,
                           child: Text(
                             "27%",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 17,
                             ),
                           ),
                         )
                       ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.grey,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top:8,left: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Capacity % after SOP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "27%",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
                height: 1,
                thickness:1)
          ],
        )
      ),
    );
  }
}

