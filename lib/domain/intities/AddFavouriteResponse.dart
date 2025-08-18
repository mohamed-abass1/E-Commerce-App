/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428eb43dc1175abc65ca0b3"]

class AddFavouriteResponseEntity {
  AddFavouriteResponseEntity({
      this.status, 
      this.message, 
      this.data,});

  String? status;
  String? message;
  List<String>? data;

}