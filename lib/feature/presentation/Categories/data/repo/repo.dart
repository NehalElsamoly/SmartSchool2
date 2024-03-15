import 'package:dartz/dartz.dart';

import '../../../../../core/ulits/errors.dart';
import '../model/model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PostsModel>> FetchPosts();
}