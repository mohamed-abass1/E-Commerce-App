/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428eb43dc1175abc65ca0b3","6428ead5dc1175abc65ca0ad","6428cf07dc1175abc65ca049","6428e778dc1175abc65ca08a","6428e884dc1175abc65ca096"]

class RemoveFavouriteResponseEntity {
  RemoveFavouriteResponseEntity({
      this.status, 
      this.message, 
      this.data,});

  String? status;
  String? message;
  List<String>? data;


}