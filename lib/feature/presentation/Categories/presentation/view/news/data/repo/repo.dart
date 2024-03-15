import 'package:dartz/dartz.dart';

import '../../../../../../../../core/ulits/errors.dart';

import '../model/modelnews.dart';

abstract class NewsRepo {
  Future<Either<Failure, NewsModel>> FetchNews();
}