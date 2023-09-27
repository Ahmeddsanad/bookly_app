// ignore_for_file: unrelated_type_equality_checks

import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}


// ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.only(
//             bottom: 20,
//           ),
//           child: BookListViewItem(),
//         );
//       },
//     );