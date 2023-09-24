import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              if (state is NewestBooksSuccess) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 20,
                      ),
                      child: BookListViewItem(
                        bookModel: state.books[index],
                      ),
                    );
                  },
                  itemCount: state.books.length,
                );
              } else if (state is NewestBooksError) {
                return SliverToBoxAdapter(
                  child: CustomErrorWidget(
                    errMessage: state.errMessage,
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                    child: CustomLoadingIndicator());
              }
            },
          );
        } else if (state is NewestBooksError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errMessage: state.errMessage,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
