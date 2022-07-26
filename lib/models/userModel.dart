class UserModel {
  String? name;
  String? email;
  String? phone;
  String? userID;
  String? image;
  String? cover;
  String? bio;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.userID,
    this.image,
    this.cover,
    this.bio,

  });
  UserModel.fromJson(Map<String ,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    userID=json['userID'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];


  }
  Map<String ,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'userID':userID,
      'image':image,
      'cover':cover,
      'bio':bio
    };
  }
}