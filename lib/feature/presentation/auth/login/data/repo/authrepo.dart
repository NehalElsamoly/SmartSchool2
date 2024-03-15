
import 'package:dartz/dartz.dart';

import '../../../../../../core/ulits/errors.dart';


abstract class AuthRepo {
  Future<Either<Failure, String>> loginUser(
      {required String email, required String password,required String status});
  Future<Either<Failure, String>> signupUser(
      {required String name, required String email, required String password});
}