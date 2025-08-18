
import '../../domain/intities/ProductResponseEntity.dart';
import 'FavouriteResponseDM.dart';
import 'categoryRespnonseDM.dart';

class ProductResponseDm extends ProductResponseEntity{
  ProductResponseDm({
      super.results,
    this.statusMsg,
    this.message,
      super.metadata,
      super.data,});
String? statusMsg;
  String? message;

  ProductResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    results = json['results'];
    metadata = json['metadata'] != null ? ProductMetadataDM.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavouriteDataDM.fromJson(v));
      });
    }
  }

}

class ProductDM extends ProductEntity {
  ProductDM({
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
    super.updatedAt,});

  ProductDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDM.fromJson(v));
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
    category = json['category'] != null ? CategoryResponseDM.fromJson(json['category']) : null;
    brand = json['brand'] != null ? CategoryResponseDM.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

}



class SubcategoryDM extends SubcategoryEntity {
  SubcategoryDM({
      super.id,
      super.name,
      super.slug,
      super.category,});

  SubcategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }


}

class ProductMetadataDM extends ProductMetaDataEntity{
  ProductMetadataDM({
      super.currentPage,
      super.numberOfPages,
      super.limit,
      super.nextPage,});

  ProductMetadataDM.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }


}