class UpdateUserDataResponseEntity {
  UpdateUserDataResponseEntity({
      this.message, 
      this.user,});

  String? message;
  UserEntity? user;


}

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;


}