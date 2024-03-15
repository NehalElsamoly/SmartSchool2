import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

// The ApiService class for making HTTP GET and POST requests
class ApiService {
  // Base URL for the Google Books API

  String? token;
  // Dio instance used for making HTTP requests
  final Dio _dio;

  // Constructor to initialize the ApiService with a Dio instance
  ApiService(this._dio);

  // Asynchronous function to make a GET request to the API
  Future<dynamic> get({required String endPoint}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('auth-token') == null) {
      prefs.setString('auth-token', '');
    }
    token = prefs.getString('auth-token')??"";

    // Send a GET request to the specified endPoint by combining it with the base URL
    var response = await _dio.get(
      '$baseurl$endPoint',
      options: Options(
          headers: {
       //  'Content-Type': 'application/json',
       // 'Authorization': 'Bearer $token'
      }),
    );
print("server");
    // Return the response data as a map (dynamic) containing key-value pairs
    return response.data;
  }

  // Asynchronous function to make a POST request to the API
  Future<Map<String, dynamic>> post(
      {required String endPoint, dynamic data,dynamic formdata}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('auth-token') == null) {
      prefs.setString('auth-token', '');
    }
    token = prefs.getString('auth-token');
print("post");
print('$baseurl$endPoint');
print(formdata);
    // Send a POST request to the specified endPoint by combining it with the base URL
    var response = await _dio.post(
      '$baseurl$endPoint',
      data: formdata ?? data,
      options: Options(
          headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }
      ),
    );
    print("print data");
print(response.data);
print(response.statusCode);
    // Return the response data as a map (dynamic) containing key-value pairs
    return response.data;
  }
}