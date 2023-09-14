import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              bColor: Colors.white,
              borderRadiusGeometry: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: '19.99€',
              textStyle: Styles.textStyle20.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              bColor: const Color(0xFFEF8262),
              borderRadiusGeometry: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textStyle: Styles.textStyle18.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              text: 'Free preview',
            ),
          ),
        ],
      ),
    );
  }
}
