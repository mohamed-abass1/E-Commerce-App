import 'package:e_commerece_online_c13/domain/intities/FavouriteResponseEntity.dart';

/// status : "success"
/// count : 2
/// data : [{"sold":15363,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":191,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2025-06-29T17:50:56.514Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"},{"sold":103025490,"images":["1680403266805-1.jpeg","1680403266806-3.jpeg","1680403266806-2.jpeg","1680403266807-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:41:07.506Z","updatedAt":"2025-06-29T18:42:39.562Z","__v":0,"id":"6428eb43dc1175abc65ca0b3"}]

class FavouriteResponseDm extends FavouriteResponseEntity{
  FavouriteResponseDm({
    this.message,
      super.status,
      super.count,
      super.data,});
  String? message;

  FavouriteResponseDm.fromJson(dynamic json) {
    message = json['message'];

    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavouriteDataDM.fromJson(v));
      });
    }
  }

}

/// sold : 15363
/// images : ["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 191
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2025-06-29T17:50:56.514Z"
/// __v : 0
/// id : "6428ebc6dc1175abc65ca0b9"

class FavouriteDataDM extends FavouriteDataEntity{
  FavouriteDataDM({
      super.sold,
      super.images,
      super.subcategory,
      super.ratingsQuantity,
      super.id,
      super.title,
      super.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.createdAt,
      super.updatedAt,
      super.v,});

  FavouriteDataDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(FavouriteSubcategoryDM.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? FavouriteCategoryDM.fromJson(json['category']) : null;
    brand = json['brand'] != null ? FavouriteBrandDM.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }


}

/// _id : "64089bbe24b25627a253158b"
/// name : "DeFacto"
/// slug : "defacto"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"

class FavouriteBrandDM extends FavouriteBrandEntity{
  FavouriteBrandDM({
      super.id,
      super.name,
      super.slug,
      super.image,});

  FavouriteBrandDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }



}

/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

class FavouriteCategoryDM extends FavouriteCategoryEntity{
  FavouriteCategoryDM({
      super.id,
      super.name,
      super.slug,
      super.image,});

  FavouriteCategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }


}

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"

class FavouriteSubcategoryDM extends FavouriteSubcategoryEntity{
  FavouriteSubcategoryDM({
      super.id,
      super.name,
      super.slug,
      super.category,});

  FavouriteSubcategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }



}