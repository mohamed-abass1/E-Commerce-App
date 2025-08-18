import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/AddToCartResponseDM.dart';
import 'package:e_commerece_online_c13/data/model/logInResponseDTO.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/intities/AddToCartResponseEntity.dart';
import '../../domain/repositories/data_source/addToCartDataSource.dart';
@Injectable(as:AddToCartDataSource )
class AddToCartDataSourceImpl implements AddToCartDataSource{
  ApiManger apiManger;
  AddToCartDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, AddToCartResponseEntity>> AddToCart(String productId)async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.addToCart(productId);
        var addToCartResponse = AddToCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(addToCartResponse);
        }
        else {
          return left(ServerError(ErrorMsg: addToCartResponse .message!));
        }
      }
      else {
        return left(ClientError(ErrorMsg: 'please check your internet'));
      }
    }catch(e){return left(ServerError(ErrorMsg: e.toString()));}
  }

}