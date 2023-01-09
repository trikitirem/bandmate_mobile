import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/theme/color_palette.dart';

import '../../models/chat_option.dart';

class ChatOptionWidget extends StatelessWidget {
  const ChatOptionWidget({
    super.key,
    required this.option,
  });

  final ChatOption option;

  Color color() {
    if (option.type == ChatOptionType.warning) {
      return PrimaryPalette.primary;
    }

    return GreyPalette.darkGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: GreyPalette.borderGrey))),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            option.iconPath,
            color: color(),
          ),
          const SizedBox(width: 16.0),
          Text(
            option.label,
            style: TextStyle(
              color: color(),
            ),
          )
        ],
      ),
    );
  }
}
