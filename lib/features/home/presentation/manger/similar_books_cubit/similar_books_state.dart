part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksError extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksError(this.errMessage);
}
