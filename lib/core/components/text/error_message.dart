import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return errorMessage != null
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          )
        : Container();
  }
}
