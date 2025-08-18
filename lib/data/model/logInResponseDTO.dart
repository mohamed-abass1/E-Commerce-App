import '../../domain/intities/logInResponseEntity.dart';

class LogInResponseDto extends LogInResponseEntity  {
  LogInResponseDto({
      super.message,
    super.statusMsg,
      this.user, 
      super.token,});

  LogInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;

}


class User extends UserEntity {
  User({
      super.name,
      super.email,
      super.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  
}