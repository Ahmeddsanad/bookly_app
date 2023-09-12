import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png'),
            ),
          ),
          // child: Image.asset('assets/images/3.png'),
        ),
      ),
    );
  }
}
