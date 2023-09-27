// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<List<BookModel>> getBooks({required String searchText}) async {
    emit(SearchBooksLoading());
    try {
      var result = await searchRepo.getBooks(searchText: searchText);
      emit(SearchBooksSuccess(result));
      return result;
    } on Exception catch (e) {
      emit(SearchBooksError(e.toString()));
      print(e.toString());
    }
    return [];
  }
}
