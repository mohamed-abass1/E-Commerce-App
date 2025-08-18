import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/AddFavouriteResponse.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_source/AddFavouriteDataSource.dart';
import '../../domain/repositories/data_source/FavouriteDataSource.dart';
import '../model/AddFavouriteResponseDM.dart';
import '../model/FavouriteResponseDM.dart';
@Injectable(as: AddFavouriteDataSource)
class AddFavouriteDataSourceImpl implements AddFavouriteDataSource{
  ApiManger apiManger;
  AddFavouriteDataSourceImpl({required this.apiManger});

  @override

    Future<Either<Failers, AddFavouriteResponseDm>> AddFavourite(productId)async{

      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      try{ if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.AddFavourite(productId);
        var AddFavouriteResponse=AddFavouriteResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300){return right(AddFavouriteResponse);}
        else{return left(ServerError(ErrorMsg: AddFavouriteResponse.message!));}
      }
      else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}
      }catch(e){return Left(ClientError(ErrorMsg: e.toString()));}
    }


}
