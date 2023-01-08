import 'package:flutter/material.dart';
import 'package:mobile/common/theme/color_palette.dart';

class FormTextInput extends StatelessWidget {
  const FormTextInput({
    super.key,
    this.hintText,
    required this.onChanged,
    this.obscure,
    this.initialValue,
    this.icon,
  });

  final String? hintText;
  final void Function(String? value) onChanged;
  final bool? obscure;
  final String? initialValue;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GreyPalette.backgroundGrey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null ? icon! : Container(),
            icon != null
                ? const SizedBox(
                    width: 16.0,
                  )
                : Container(),
            Flexible(
              child: TextFormField(
                initialValue: initialValue,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: onChanged,
                obscureText: obscure ?? false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
