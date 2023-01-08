import 'package:flutter/material.dart';

import 'input_decoration.dart';

class TextArea extends StatelessWidget {
  const TextArea(
      {super.key, this.hintText, required this.onChanged, this.initialValue});

  final String? hintText;
  final void Function(String? value) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        cursorColor: Colors.black,
        maxLines: null,
        minLines: 5,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          border: kInputBorder,
          focusedBorder: kInputBorderFocused,
        ),
      ),
    );
  }
}
