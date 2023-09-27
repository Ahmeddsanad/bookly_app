import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged, this.onSubmitted});

  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
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
