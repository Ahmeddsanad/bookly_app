import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        16,
      ),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}


// AspectRatio(
//       aspectRatio: 2.6 / 4,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(
//             16,
//           ),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: NetworkImage(
//               imageUrl,
//             ),
//           ),
//         ),
//         // child: Image.asset('assets/images/3.png'),
//       ),
//     );