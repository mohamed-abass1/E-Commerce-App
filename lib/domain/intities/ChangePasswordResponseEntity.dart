class ChangePasswordResponseEntity {
  ChangePasswordResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  ChangePasswordUserEntity? user;
  String? token;


}

class ChangePasswordUserEntity {
  ChangePasswordUserEntity({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;


}