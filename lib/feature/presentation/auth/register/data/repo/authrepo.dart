
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/ulits/errors.dart';
import '../model/getlevels.dart';


abstract class AuthRepo2 {
  Future<Either<Failure, String>> Register(
      {
            required String parent_name_en, required String parent_name_ar,required String parent_email,required String parent_mobile,
        required String parent_data_birth
        ,required String parent_national_id

        ,required String parent_address
        ,required String parent_job,
        required String parent_gender,required String child_name_en,required String child_name_ar,required String child_date_birth,
        required String child_gender,required String child_level,required String child_school_name,required File parent_personal_identification,required File child_birth_certificate});
  Future<Either<Failure, GetLevelsResponse>> FetchLevels();

}