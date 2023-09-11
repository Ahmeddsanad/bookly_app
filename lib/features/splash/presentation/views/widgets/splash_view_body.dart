import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(
          flex: 4,
        ),
        Image.asset(
          AssetsData.logo,
          scale: 1.3,
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          'Read Free Books',
          style: TextStyle(
            // color: Colors.white.withOpacity(0.3),
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
