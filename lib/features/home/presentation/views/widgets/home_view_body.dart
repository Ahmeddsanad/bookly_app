import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/Featured_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBooksListView(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    'Best Seller',
                    style: Styles.textStyle18,
                  ),
                ),
              ],
            ),
          ),
        ),
        //SliverToBoxAdapter and put shrikwrap
        BestSellerListView(),
      ],
    );
  }
}
