import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? formatters;
  final TextInputType textInputType;
  final IconData prefixIcon;
  final String labelTitle;
  final String errorTitle;
  final bool obscureText;
  final Function()? onPressed;
  const InputWidget({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.textInputType,
    required this.prefixIcon,
    required this.labelTitle,
    required this.obscureText,
    this.onPressed,
    required this.errorTitle,
    this.formatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatters,
      controller: controller,
      keyboardType: textInputType,
      enableSuggestions: true,
      validator: (value) => value!.isEmpty ? errorTitle : null,
      cursorColor: Colors.black,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelTitle,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: onPressed,
          child: Icon(suffixIcon),
        ),
        prefixIcon: Icon(prefixIcon),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}
