class UserModel {
  String fullName, nickName, phoneNumber, adress, image;

  UserModel(
      {required this.adress,
      required this.fullName,
      required this.image,
      required this.nickName,
      required this.phoneNumber});

  factory UserModel.fromJson(Map data) {
  

    return data.isNotEmpty ? UserModel(
        adress: data['address'] ?? "",
        fullName: data['fullname'] ?? "",
        nickName: data['nickname'] ?? "",
        image: data['image'] ?? "",
        phoneNumber: data['phonenum'] ?? "") : UserModel(
        adress:  "",
        fullName:"",
        nickName:  "",
        image:"",
        phoneNumber:"");
  }

  Map<String, String> toJson() {
    return {
      'fullname': fullName,
      'address': adress,
      'nickname': nickName,
      'phonenum': phoneNumber,
      'image': image
    };
  }
}
