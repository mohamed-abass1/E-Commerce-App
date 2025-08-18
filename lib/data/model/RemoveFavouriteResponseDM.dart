
import '../../domain/intities/RemoveFavouriteResponseEntity.dart';

/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428eb43dc1175abc65ca0b3","6428ead5dc1175abc65ca0ad","6428cf07dc1175abc65ca049","6428e778dc1175abc65ca08a","6428e884dc1175abc65ca096"]

class RemoveFavouriteResponseDm extends RemoveFavouriteResponseEntity{
  RemoveFavouriteResponseDm({
      super.status,
      super.message,
      super.data,});

  RemoveFavouriteResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }


}