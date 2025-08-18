
import '../../domain/intities/GetSpecificProduct.dart';

class GetSpecificProductResponseDm extends GetSpecificProductResponseEntity{
  GetSpecificProductResponseDm({
      super.data,});

  GetSpecificProductResponseDm.fromJson(dynamic json) {
    data = json['data'] != null ? GetSpecificProductDataDM.fromJson(json['data']) : null;
  }


}

class GetSpecificProductDataDM extends GetSpecificProductData{
  GetSpecificProductDataDM({
      super.sold,
    super.images,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.reviews,
      });

  GetSpecificProductDataDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['reviews'] != null) {
    }
    id = json['id'];
  }}