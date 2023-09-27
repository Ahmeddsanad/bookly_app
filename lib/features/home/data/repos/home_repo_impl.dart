// ignore_for_file: non_constant_identifier_names

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=compuer science',
      );

      List<BookModel> Books = [];

      for (var item in data['items']) {
        try {
          Books.add(BookModel.fromJson(item));
        } catch (e) {
          print(item);
        }
      }

      return right(Books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
      );

      List<BookModel> Books = [];

      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }

      return right(Books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance',
      );

      List<BookModel> Books = [];

      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }

      return right(Books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}



//there is way to avoid using for in loop to add data in empty list 
//by selecting all response of request and make a json file of it 
//instead of taking a list to make json file