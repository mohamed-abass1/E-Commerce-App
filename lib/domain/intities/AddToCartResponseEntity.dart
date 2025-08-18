class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status,
    this.statusMsg,
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});
  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
  String? cartId;
  DataEntity? data;


}

class DataEntity {
  DataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<ProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;


}

class ProductsEntity {
  ProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  String? product;
  num? price;


}