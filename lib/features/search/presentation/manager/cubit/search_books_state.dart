part of 'search_books_cubit.dart';

class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> books;

  const SearchBooksSuccess(this.books);
}

class SearchBooksError extends SearchBooksState {
  final String errMessage;

  const SearchBooksError(this.errMessage);
}
