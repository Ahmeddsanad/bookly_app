// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
// import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<List<BookModel>> getBooks({required String searchText}) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=$searchText',
      );

      final List<BookModel> Books = [];

      for (var item in data['items']) {
        try {
          Books.add(BookModel.fromJson(item));
        } catch (e) {
          print(item);
        }
      }
      return Books;
    } catch (error) {
      print(error);
    }
    return [];
  }
}
