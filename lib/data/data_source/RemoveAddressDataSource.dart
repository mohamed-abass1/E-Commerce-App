import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/repositories/data_source/FavouriteDataSource.dart';
import '../../domain/repositories/data_source/RemoveAddressDataSource.dart';
import '../../domain/repositories/data_source/RemoveFavouriteDataSource.dart';
import '../model/FavouriteResponseDM.dart';
import '../model/RemoveAddressResponseDm.dart';
import '../model/RemoveFavouriteResponseDM.dart';
@Injectable(as: RemoveAddressDataSource)
class RemoveAddressDataSourceImpl implements RemoveAddressDataSource{
  ApiManger apiManger;
  RemoveAddressDataSourceImpl({required this.apiManger});

  Future<Either<Failers, RemoveAddressResponseDm>> RemoveAddress(String productId)async{

    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

   try{ if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await apiManger.RemoveAddress(productId);
      var FavouriteResponse=RemoveAddressResponseDm.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300){return right(FavouriteResponse);}
      else{return left(ServerError(ErrorMsg: FavouriteResponse.message!));}
    }
else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}
  }catch(e){return Left(ClientError(ErrorMsg: e.toString()));}
  }


}