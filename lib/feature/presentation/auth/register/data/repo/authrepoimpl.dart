import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:zahra/feature/presentation/auth/register/data/model/getlevels.dart';
import '../../../../../../core/ulits/apiservice3.dart';
import '../../../../../../core/ulits/const.dart';
import '../../../../../../core/ulits/errors.dart';
import 'authrepo.dart';

class AuthRepoImpl2 implements AuthRepo2 {
  final ApiService apiService;

  AuthRepoImpl2(this.apiService);

  @override
  Future<Either<Failure, String>> Register(
      {required String parent_name_en,
      required String parent_name_ar,
      required String parent_email,
      required String parent_mobile,
      required String parent_data_birth,
      required String parent_national_id,
      required String parent_address,
      required String parent_job,
      required String parent_gender,
      required String child_name_en,
      required String child_name_ar,
      required String child_date_birth,
      required String child_gender,
      required String child_level,
      required String child_school_name,
      required File parent_personal_identification,
      required File child_birth_certificate}) async {
    try {
      print("nehal");
      // print(parent_personal_identification);
      // print(child_birth_certificate);

      print({
        'parent_name_en': parent_name_en,
        'parent_name_ar': parent_name_ar,
        'parent_email': parent_email,
        'parent_mobile': parent_mobile,
        'parent_data_birth': parent_data_birth,
        'parent_national_id': parent_national_id,
        'parent_address': parent_address,
        'parent_job': parent_job,
        'parent_gender': parent_gender,
        'child_name_en': child_name_en,
        'child_name_ar': child_name_ar,
        'child_date_birth': child_date_birth,
        'child_gender': child_gender,
        'child_level': child_level,
        'child_school_name': child_school_name,
        'parent_personal_identification': await MultipartFile.fromFile(
            parent_personal_identification.path,
            filename: "parent_personal_identification"),
        'child_birth_certificate': await MultipartFile.fromFile(
            child_birth_certificate.path,
            filename: "child_birth_certificate"),
      });
      var data = await apiService.post(
        endPoint: 'api/register',
        formdata:
          FormData.fromMap(
          {
          'parent_name_en': parent_name_en,
          'parent_name_ar': parent_name_ar,
          'parent_email': parent_email,
          'parent_mobile': parent_mobile,
          'parent_data_birth': parent_data_birth,
          'parent_national_id': parent_national_id,
          'parent_address': parent_address,
          'parent_job': parent_job,
          'parent_gender': parent_gender,
          'child_name_en': child_name_en,
          'child_name_ar': child_name_ar,
          'child_date_birth': child_date_birth,
          'child_gender': child_gender,
          'child_level': child_level,
          'child_school_name': child_school_name,
          'parent_personal_identification': await MultipartFile.fromFile(
              parent_personal_identification.path,
              filename: "parent_personal_identification.png"),
          'child_birth_certificate': await MultipartFile.fromFile(
              child_birth_certificate.path,
              filename: "child_birth_certificate.png"),
          })

      );
      print("nehaLLLLLLLLLL");
      String Message = data['Message'];
      if (kDebugMode) {
        print(Message);
      }
      return right(Message);
    } catch (e) {
      if (e is DioException) {
        print(e.response);
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
  uploadFile( {required String parent_name_en,
    required String parent_name_ar,
    required String parent_email,
    required String parent_mobile,
    required String parent_data_birth,
    required String parent_national_id,
    required String parent_address,
    required String parent_job,
    required String parent_gender,
    required String child_name_en,
    required String child_name_ar,
    required String child_date_birth,
    required String child_gender,
    required String child_level,
    required String child_school_name,
    required File parent_personal_identification,
    required File child_birth_certificate}) async {
    Map data= {
      // FormData.fromMap(
      // {
      'parent_name_en': parent_name_en,
      'parent_name_ar': parent_name_ar,
      'parent_email': parent_email,
      'parent_mobile': parent_mobile,
      'parent_data_birth': parent_data_birth,
      'parent_national_id': parent_national_id,
      'parent_address': parent_address,
      'parent_job': parent_job,
      'parent_gender': parent_gender,
      'child_name_en': child_name_en,
      'child_name_ar': child_name_ar,
      'child_date_birth': child_date_birth,
      'child_gender': child_gender,
      'child_level': child_level,
      'child_school_name': child_school_name,
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseurl/api/register'));
    var length = await parent_personal_identification.length();
    var stream = http.ByteStream(parent_personal_identification.openRead());
    var multiPartFile = http.MultipartFile('child_birth_certificate', stream, length,
        filename: basename(child_birth_certificate.path));
    var length2 = await child_birth_certificate.length();
    var stream2 = http.ByteStream(child_birth_certificate.openRead());
    var multiPartFile2 = http.MultipartFile('parent_personal_identification', stream2, length2,
    filename: basename(child_birth_certificate.path));
    request.files.add(multiPartFile);
    request.files.add(multiPartFile2);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error ${myRequest.statusCode}');
      print(myRequest.request!.url);
      print(response!.body);

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

  @override
  Future<Either<Failure, GetLevelsResponse>> FetchLevels() async{
    try {
      var data = await apiService.get(endPoint:'api/levels');
      var postsModel = GetLevelsResponse.fromJson(data);
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

