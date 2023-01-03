import 'package:flutter/material.dart';

class InterestsRowItem extends StatelessWidget {
  const InterestsRowItem({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
