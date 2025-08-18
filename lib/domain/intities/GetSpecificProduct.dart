class GetSpecificProductResponseEntity {
  GetSpecificProductResponseEntity({
      this.data,});

  GetSpecificProductData? data;


}

class GetSpecificProductData {
  GetSpecificProductData({
      this.sold, 
      this.images, 
      this.ratingsQuantity,
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.ratingsAverage,
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.reviews, 
      });

  num? sold;
  List<String>? images;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;
  List<dynamic>? reviews;


}
