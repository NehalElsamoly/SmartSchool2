import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:zahra/feature/presentation/Categories/data/model/model.dart';
import 'package:zahra/feature/presentation/Categories/data/repo/repo.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/news/data/repo/repo.dart';

import '../../../../../../../../core/ulits/apiservice3.dart';
import '../../../../../../../../core/ulits/errors.dart';
import '../model/modelnews.dart';

class NewsRepoImpl implements NewsRepo {
  final ApiService apiService;

  NewsRepoImpl(this.apiService);
  @override
  Future<Either<Failure,NewsModel>> FetchNews() async {
    try {
      var data = await apiService.get(endPoint:'/api/news?id=1');
      //كده معايا الريسبونس كله عاوز منه الداتا بس
      var newsModel = NewsModel.fromJson(data);
      print("nehal");
      print(newsModel);
      return right(newsModel);
    } catch (e) {
      print("repo error");
      print(e.toString());
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          print("error: The requested resource was not found.");
          return left(ServerFailure("The requested resource was not found."));
        } else {
          print("repo error");
          print("error: ${e.message}");
          return left(ServerFailure.fromDioError(e));
        }
      }
      return left(
        ServerFailure(
          e.toString(),
        ),

      );

    }
  }
}
