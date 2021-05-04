import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safeouts_business/models/product.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Product product){
    return _db.collection('Restaurants').doc(product.productId).set(product.toMap());
  }

  Stream<List<Product>> getProducts(){
    return _db.collection('Restaurants').snapshots().map((snapshot) => snapshot.docs.map((document) => Product .fromFirestore(document.data())).toList());
  }

  Future<void> removeProduct(String productId){
    return _db.collection('Restaurants').doc(productId).delete();
  }


}