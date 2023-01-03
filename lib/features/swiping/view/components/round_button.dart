import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.child, required this.onClick});

  final Widget child;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(999),
        ),
        elevation: 2,
        child: SizedBox(
          height: 60,
          width: 60,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
