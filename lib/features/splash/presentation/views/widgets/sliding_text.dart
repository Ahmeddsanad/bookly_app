import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              style: TextStyle(
                // color: Colors.white.withOpacity(0.3),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
