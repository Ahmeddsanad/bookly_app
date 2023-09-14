import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.bColor,
      required this.borderRadiusGeometry,
      required this.text,
      required this.textStyle});

  Color bColor;
  BorderRadiusGeometry borderRadiusGeometry;
  String text;
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: bColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadiusGeometry),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
