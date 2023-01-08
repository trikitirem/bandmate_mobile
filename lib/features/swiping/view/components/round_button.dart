import 'package:flutter/material.dart';
import 'package:mobile/common/theme/color_palette.dart';

const _borderRadius = BorderRadius.all(
  Radius.circular(24.0),
);

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.child, required this.onClick});

  final Widget child;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Material(
        borderRadius: _borderRadius,
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: _borderRadius,
              border: Border.all(color: GreyPalette.borderGrey)),
          height: 64,
          width: 64,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
