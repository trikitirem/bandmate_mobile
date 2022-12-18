import 'package:flutter/material.dart';

import 'input_decoration.dart';

class FormTextInput extends StatelessWidget {
  const FormTextInput({
    super.key,
    this.hintText,
    required this.onChanged,
    this.obscure,
  });

  final String? hintText;
  final void Function(String? value) onChanged;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        border: kInputBorder,
        focusedBorder: kInputBorderFocused,
      ),
      onChanged: onChanged,
      obscureText: obscure ?? false,
    );
  }
}
