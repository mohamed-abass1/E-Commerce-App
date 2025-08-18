
import '../../domain/intities/RegisterResponse.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"mohamedabass@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MjllNmUyZGQxNjY1YmFjZmJkNmRkZSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQ3NTc2NTQ2LCJleHAiOjE3NTUzNTI1NDZ9.oq9Cnb4-ZsNloMBTaAjzXdSAoWr8vAsypRiPo_T_GIU"

class AuthResponseDto extends RegisterResponseEntity{
  AuthResponseDto({
      super.message,
      super.user,
    super.statusMsg,
      this.token,});

  AuthResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? token;


}



class User extends UserEntity{
  User({
      super.name,
      super.email,
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;


}