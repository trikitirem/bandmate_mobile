import 'package:flutter/material.dart';

class MultiSelectItem extends StatelessWidget {
  const MultiSelectItem({
    super.key,
    required this.selected,
    required this.label,
    required this.onClick,
  });

  final bool selected;
  final String label;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Material(
        elevation: selected ? 2 : 0,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 2.0,
              color: selected ? Colors.black : Colors.black45,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.black : Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
