import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Search',
        border: BuildOutLineInputBorder(),
        focusedBorder: BuildOutLineInputBorder(),
        enabledBorder: BuildOutLineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  OutlineInputBorder BuildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        8,
      ),
    );
  }
}
