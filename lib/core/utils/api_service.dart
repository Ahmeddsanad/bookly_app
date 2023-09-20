// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:dio/dio.dart';

class ApiService {
  final String _BaseURL = 'https://www.googleapis.com/books/v1/';
  // final String _param = 'volumes';

  final Dio _dio;

  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_BaseURL$endPoint');

    return response.data;
  }
}
