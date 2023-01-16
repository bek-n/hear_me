
class UserModel {
  String fullName;
  String nickName;
 
  String image;

  UserModel({
    required this.fullName,
    required this.nickName,
    
    required this.image,
  });

  factory UserModel.fromJson(Map data){
    return UserModel(fullName: data['fullName'],
        nickName: data['nickName'],
       
      image: data['image'],
      

    );
  }

  Map<String,String> toJson(){
    return {
      "fullName": fullName ,
      "nickName": nickName ,
     
      "image": image,
    };
  }
}