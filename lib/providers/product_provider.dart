import 'package:flutter/material.dart';
import 'package:safeouts_business/models/product.dart';
import 'package:safeouts_business/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  double _price;
  String _productId;

  String _restaurantName;
  String _restaurantAddress;
  double _restaurantPhone;
  double _restaurantCop;
  double _restaurantSop;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  double get price => _price;

  String get restaurantName => _restaurantName;
  String get restaurantAddress => _restaurantAddress;
  double get restaurantPhone => _restaurantPhone;
  double get restaurantCop => _restaurantCop;
  double get restaurantSop => _restaurantSop;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  changeRName(String value) {
    _restaurantName = value;
    notifyListeners();
  }
  changeRAddress(String value) {
    _restaurantAddress = value;
    notifyListeners();
  }
  changeRPhone(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  loadValues(Product product){


    _restaurantName=product.name;
    _restaurantAddress=product.address;
    _restaurantPhone=product.phone;
    _restaurantCop=product.cop;
    _restaurantSop=product.sop;
  }


  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(name:
      restaurantName, address: restaurantAddress,phone:restaurantPhone,
          cop:restaurantCop,sop:restaurantSop, productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct =
      Product(name:
      restaurantName, address: restaurantAddress,phone:restaurantPhone,
          cop:restaurantCop,sop:restaurantSop, productId: uuid.v4());
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId){
    firestoreService.removeProduct(productId);
  }

}
