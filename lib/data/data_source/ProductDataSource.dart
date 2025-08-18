import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/brandDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../domain/repositories/data_source/ProductDataSource.dart';
import '../model/categoryRespnonseDM.dart';
@Injectable(as:ProductDataSource )
class ProductDataSourceImpl implements ProductDataSource{
  ApiManger apiManger;
  ProductDataSourceImpl({required this.apiManger});

    Future<Either<Failers, ProductResponseEntity>> getProducts()async{

      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      try{ if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.getProducts();
        var ProductResponse=ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300){return right(ProductResponse);}
        else{return left(ServerError(ErrorMsg: ProductResponseDm().message!));}
      }
      else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}
      }catch(e){return Left(ClientError(ErrorMsg: e.toString()));}
    }


  }

