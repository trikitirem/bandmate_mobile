import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/common/theme/color_pallete.dart';

const List<String> _assetsPaths = [
  "assets/icons/note.svg",
  "assets/icons/message.svg",
  "assets/icons/group.svg",
  "assets/icons/user.svg",
];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currendScreenIndex,
    required this.onChange,
  });

  final int currendScreenIndex;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black12),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 64.0,
          vertical: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < _assetsPaths.length; i++)
              GestureDetector(
                onTap: () => onChange(i),
                child: SvgPicture.asset(
                  _assetsPaths[i],
                  color:
                      currendScreenIndex == i ? PrimaryPalette.primary : null,
                ),
              )
          ],
        ),
      ),
    );
  }
}
