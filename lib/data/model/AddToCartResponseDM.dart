
import '../../domain/intities/AddToCartResponseEntity.dart';

class AddToCartResponseDm extends AddToCartResponseEntity {
  AddToCartResponseDm({
    super.statusMsg,
      super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,});

  AddToCartResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    status = json['status'];

    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDM.fromJson(json['data']) : null;
  }



}

class DataDM extends DataEntity{
  DataDM({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,
  });

  DataDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

}

class ProductsDM extends ProductsEntity {
  ProductsDM({
      super.count,
      super.id,
      super.product,
      super.price,});

  ProductsDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }


}