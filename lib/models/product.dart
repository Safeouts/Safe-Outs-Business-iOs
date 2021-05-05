class Product {
  final String productId;
  final String name;
  final String address;
  final double phone;
  final double cop;
  final double sop;

  Product({this.productId,this.name, this.address,this.phone,this.cop,this.sop});

  Map<String,dynamic> toMap(){
    return {
      'productId' : productId,
      'name' : name,
      'address' : address,
      'phone' : phone,
      'cop' : cop,
      'sop' : sop,
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        address = firestore['address'],
        phone = firestore['phone'],
        cop = firestore['cop'],
        sop = firestore['sop'];
}
