import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 30,
            ),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                        'https://books.goalkicker.com/DotNETFrameworkBook/DotNETFrameworkGrow.png',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '${bookModel.volumeInfo.title}',
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                  rating: bookModel.volumeInfo.averageRating ?? 0,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksAction(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
