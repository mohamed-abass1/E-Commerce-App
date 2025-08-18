

class LogInResponseEntity  {
  LogInResponseEntity({
      this.message,
    this.statusMsg,
    this.token
});
  String? token;

  String? message;
  String? statusMsg;


}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuti@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;


}