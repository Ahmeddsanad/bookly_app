import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 4,
        ),
        Center(
          child: Image.asset(
            AssetsData.logo,
            scale: 2,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          'improving your mentality.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontSize: 16,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
