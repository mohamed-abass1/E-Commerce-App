import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/intities/CartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/brandDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/cach/SharedPrefrence.dart';
import '../../domain/repositories/data_source/CartDataSource.dart';
import '../../domain/repositories/data_source/ProductDataSource.dart';
import '../model/CartResponseDM.dart';
import '../model/categoryRespnonseDM.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManger apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failers, GetCartResponseDm>> getItemsInCart() async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.Cart();
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(ErrorMsg: getCartResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(ClientError(ErrorMsg: 'Please Check YOUR INTERNET'));
      }
    } catch (e) {
      return Left(Failers(ErrorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failers, GetCartResponseEntity>> deleteItemsInCart(String productId)async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData(productId);
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(ErrorMsg: getCartResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(ClientError(
            ErrorMsg: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failers(ErrorMsg: e.toString()));
    }

  }

  Future<Either<Failers, GetCartResponseDm>> updateCountInCart(
      String productId, int count) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.updateCountInCart(productId,count);
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(ErrorMsg: getCartResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(ClientError(
            ErrorMsg: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failers(ErrorMsg: e.toString()));
    }
  }
}
