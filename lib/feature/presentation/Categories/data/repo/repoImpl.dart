import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:zahra/feature/presentation/Categories/data/model/model.dart';
import 'package:zahra/feature/presentation/Categories/data/repo/repo.dart';

import '../../../../../core/ulits/apiservice3.dart';
import '../../../../../core/ulits/errors.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure,PostsModel>> FetchPosts() async {
    try {
      var data = await apiService.get(endPoint:'api/posts');
      //كده معايا الريسبونس كله عاوز منه الداتا بس
      var postsModel = PostsModel.fromJson(data);
      print("nehal");
      print(postsModel);
      return right(postsModel);
    } catch (e) {
      print("repo error");
      print(e.toString());
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          print("error: The requested resource was not found.");
          return left(ServerFailure("The requested resource was not found."));
        } else {
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
