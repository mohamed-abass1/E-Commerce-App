import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../cach/SharedPrefrence.dart';
@singleton
class ApiManger {

var dio = Dio();
Future<Response> getDataRegister (String name, String email, String password, String rePassword, String phone){
return dio.post(
  options: Options(validateStatus: (status) => true,),
  'https://ecommerce.routemisr.com/api/v1/auth/signup',
  data: {
  "name": name,
  "email":email,
  "password":password,
  "rePassword":rePassword,
  "phone":phone
  }
  );}

Future<Response> getDataLogIN(String email,String password){
return dio.post('https://ecommerce.routemisr.com/api/v1/auth/signin',
     data: {
       "email":email,
       "password":password
     },
   options: Options(validateStatus: (status) => true,));

  }

Future<Response> getCategory(){
 return dio.get(
     'https://ecommerce.routemisr.com/api/v1/categories',
     options: Options(validateStatus: (status) => true,
     ));
}
Future<Response> getBrands(){
  return dio.get(
      'https://ecommerce.routemisr.com/api/v1/brands',
      options: Options(validateStatus: (status) => true,
      ));
}
Future<Response> getProducts(){
  return dio.get(
      'https://ecommerce.routemisr.com/api/v1/products',
      options: Options(validateStatus: (status) => true,
      ));
}

Future<Response> addToCart(String productId)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.post('https://ecommerce.routemisr.com/api/v1/cart',
      data: {
        "productId":productId,
      },
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}

Future<Response> Cart()async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.get('https://ecommerce.routemisr.com/api/v1/cart',
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}

Future<Response> deleteData(String ProductId)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.delete('https://ecommerce.routemisr.com/api/v1/cart'+'/'+ProductId,
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}
Future<Response> updateCountInCart(String ProductId,int count)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.put('https://ecommerce.routemisr.com/api/v1/cart'+'/'+ProductId,data: {'count':count},
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}

Future<Response> getFavourite()async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.get('https://ecommerce.routemisr.com/api/v1/wishlist',
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}

Future<Response> AddFavourite(String productId)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.post('https://ecommerce.routemisr.com/api/v1/wishlist',
      data: {
        "productId":productId,
      },
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}
Future<Response> RemoveFavourite(String ProductId)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.delete('https://ecommerce.routemisr.com/api/v1/wishlist'+'/'+ProductId,
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}
Future<Response> getSpecificProduct(String id)async{
  return  dio.get('https://ecommerce.routemisr.com/api/v1/products/$id',
      options: Options(validateStatus: (status) => true,));

}
Future<Response> getDataUpdateUser(String name,String email,String phone) async {
  var token= await SharedPreferenceUtils.getData(key: 'token');

  return dio.put('https://ecommerce.routemisr.com/api/v1/users/updateMe/',
      data: {
        "name": name,
        "email": email,
        "phone": phone
      },
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}
Future<Response> sendResetPassword(String email){
  return dio.post('https://ecommerce.routemisr.com/api/v1/auth/forgotPasswords',
      data: {
        "email":email,
      },
      options: Options(validateStatus: (status) => true,));

}
Future<Response> verifyCode(String code){
  return dio.post('https://ecommerce.routemisr.com/api/v1/auth/verifyResetCode',
      data: {
        "resetCode":code,
      },
      options: Options(validateStatus: (status) => true,));

}
Future<Response> resetForgottenPassword(String email,String password){
  return dio.put('https://ecommerce.routemisr.com/api/v1/auth/resetPassword',
      data: {
        "email":email,
        "newPassword":password
      },
      options: Options(validateStatus: (status) => true,));

}

Future<Response> changePassword(String oldPassword,String newPassword,String rePassword) async {
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return dio.put('https://ecommerce.routemisr.com/api/v1/users/changeMyPassword',
      data: {

          "currentPassword":newPassword,
          "password":newPassword,
          "rePassword":rePassword
      },
      options: Options(headers: {'token':token, "Content-Type": "application/json"},validateStatus: (status) => true,));

}

Future<Response> addLocation(String name,String details,String phone,String city) async {
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return dio.post('https://ecommerce.routemisr.com/api/v1/addresses',
      data: {
          "name": name,
          "details": details,
          "phone": phone,
          "city": city

      },
      options: Options(headers: {'token':token, "Content-Type": "application/json"},validateStatus: (status) => true,));

}

Future<Response> RemoveAddress(String ProductId)async{
  var token= await SharedPreferenceUtils.getData(key: 'token');
  return  dio.delete('https://ecommerce.routemisr.com/api/v1/addresses'+'/'+ProductId,
      options: Options(headers: {'token':token},validateStatus: (status) => true,));

}

Future<Response> getLocation() async {
  var token= await SharedPreferenceUtils.getData(key: 'token');

  return dio.get(
      'https://ecommerce.routemisr.com/api/v1/addresses',
      options: Options(validateStatus: (status) => true,headers: {'token':token},
      ));
}


}
