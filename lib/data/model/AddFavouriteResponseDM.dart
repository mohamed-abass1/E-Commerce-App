
import '../../domain/intities/AddFavouriteResponse.dart';

/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428eb43dc1175abc65ca0b3"]

class AddFavouriteResponseDm extends AddFavouriteResponseEntity{
  AddFavouriteResponseDm({
      super.status,
      super.message,
      super.data,});

  AddFavouriteResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}