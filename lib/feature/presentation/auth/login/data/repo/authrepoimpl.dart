
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/ulits/apiservice3.dart';
import '../../../../../../core/ulits/errors.dart';
import 'authrepo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> loginUser(
      {required String email, required String password,required String status}) async {
    try {
      var data = await apiService.post(endPoint: 'api/login', data: {
        "email": email,
        "password": password,
        "status":status,
      });

      String token = data['token'];
      if (kDebugMode) {
        print(token);
      }
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

 @override
  Future<Either<Failure, String>> signupUser(
      {required String name,
        required String email,
        required String password}) async {
    try {
      var data = await apiService.post(endPoint: 'api/register', data: {
        "name": name,
        "email": email,
        "password": password,
      });

      String token = data['token'];
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}