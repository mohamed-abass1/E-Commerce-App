import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/AddToCartResponseEntity.dart';
import '../../domain/repositories/data_source/addToCartDataSource.dart';
import '../model/AddToCartResponseDM.dart';
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