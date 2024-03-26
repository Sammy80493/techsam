// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:techsam/util/constants.dart';


class searchbar_widget extends StatelessWidget {
  const searchbar_widget({
    super.key,
    required this.searchController,
    required this.textScaler,
    this.onChanged,
  });

  final TextEditingController searchController;
  final TextScaler textScaler;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      cursorColor: Colors.black,
      autocorrect: true,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: Constants.garamond_regular,
        fontSize: textScaler.scale(18),
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        isDense: true,
        hintText: 'Search...',
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
