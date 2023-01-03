import 'package:flutter/material.dart';

import 'input_decoration.dart';

class FormTextInput extends StatelessWidget {
  const FormTextInput({
    super.key,
    this.hintText,
    required this.onChanged,
    this.obscure,
    this.initialValue,
  });

  final String? hintText;
  final void Function(String? value) onChanged;
  final bool? obscure;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
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
