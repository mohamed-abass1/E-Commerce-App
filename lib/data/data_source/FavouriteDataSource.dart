import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_source/FavouriteDataSource.dart';
import '../model/FavouriteResponseDM.dart';
@Injectable(as: FavouriteDataSource)
class FavouriteDataSourceImpl implements FavouriteDataSource{
  ApiManger apiManger;
  FavouriteDataSourceImpl({required this.apiManger});

  Future<Either<Failers, FavouriteResponseDm>> getFavourite()async{

    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

   try{ if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await apiManger.getFavourite();
      var FavouriteResponse=FavouriteResponseDm.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300){return right(FavouriteResponse);}
      else{return left(ServerError(ErrorMsg: FavouriteResponse.message!));}
    }
else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}
  }catch(e){return Left(ClientError(ErrorMsg: e.toString()));}
  }


}