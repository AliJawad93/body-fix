import 'dart:convert';

class UserModel {
  String id;
  String name;
  String email;
  String birthDay;
  String? urlImage;
  int userRole;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.birthDay,
    required this.urlImage,
    required this.userRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'birthDay': birthDay,
      'urlImage': urlImage,
      'userRole': userRole,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      birthDay: map['birthDay'] ?? '',
      urlImage: map['urlImage'] ?? '',
      userRole: map['userRole']?.toInt() ?? 1,
    );
  }
}
