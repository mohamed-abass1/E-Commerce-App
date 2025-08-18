import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/GetSpecificProduct.dart';
import '../repositories/repositories/GetSpecificProductRepositories.dart';
@injectable
class GetSpecificProductUseCase{
  GetSpecificProductRepository getSpecificProductRepository;
  GetSpecificProductUseCase({required this.getSpecificProductRepository});

  Future<Either<Failers,GetSpecificProductResponseEntity>> invoke(String id)async{
    return await getSpecificProductRepository.GetSpecificProduct(id);}
}