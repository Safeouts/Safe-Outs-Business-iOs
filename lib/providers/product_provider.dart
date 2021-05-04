import 'package:flutter/material.dart';
import 'package:safeouts_business/models/product.dart';
import 'package:safeouts_business/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  String _address;
  double _phone;
  double _cop;
  double _sop;
  String _productId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  String get address => _address;
  double get phone => _phone;
  double get cop => _cop;
  double get sop => _sop;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeAddress(String value) {
    _address = value;
    notifyListeners();
  }
  changePhone(String value) {
    _phone = double.parse(value);
    notifyListeners();
  }
  changeCop(String value) {
    _cop = double.parse(value);
    notifyListeners();
  }
  changeSop(String value) {
    _sop = double.parse(value);
    notifyListeners();
  }


  loadValues(Product product){


    _name=product.name;
    _address=product.address;
    _phone=product.phone;
    _cop=product.cop;
    _sop=product.sop;
  }


  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(name:
      name, address: address,phone:phone,
          cop:cop,sop:sop, productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct =
      Product(name: name, address: address,phone:phone,
          cop:cop,sop:sop, productId: uuid.v4());
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId){
    firestoreService.removeProduct(productId);
  }

}
