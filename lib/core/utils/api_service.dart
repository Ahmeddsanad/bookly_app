// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

class ApiService {
  final String _BaseURL = 'https://www.googleapis.com/books/v1/';
  // final String _param = 'volumes';

  final Dio dio;

  ApiService(
    this.dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_BaseURL$endPoint');

    return response.data;
  }
}
