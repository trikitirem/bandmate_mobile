import 'package:flutter/material.dart';

class ChangePhotoButton extends StatelessWidget {
  const ChangePhotoButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
