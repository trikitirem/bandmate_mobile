import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:mobile/common/theme/color_palette.dart';

List<String> _assetsPaths = [
  IconPaths.note,
  IconPaths.message,
  IconPaths.group,
  IconPaths.user,
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
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: GreyPalette.borderGrey),
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
