import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/categoryResponse.dart';
import '../repositories/repositories/categoryRepositories.dart';
@injectable
class CategoryUseCase{
  CategoryRepositories categoryRepositories;
  CategoryUseCase({required this.categoryRepositories});

  Future<Either<Failers,CategoryResponseEntity>> invoke()async{
    return await categoryRepositories.getCategory();}
}