
class UserProduct {
  final String userProductId;
  final String username;
  final double userphone;

  UserProduct({this.userProductId, this.username, this.userphone});

  Map<String, dynamic> toMap() {
    return {
      'userProductId': userProductId,
      'userName': username,
      'userPhone': userphone,
    };
  }

  UserProduct.fromuserFirestore(Map<String, dynamic> userfirestore)
      : userProductId = userfirestore['userProductId'],
        username = userfirestore['username'],
        userphone = userfirestore['userphone'];
}

