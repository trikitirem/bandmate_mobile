import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:mobile/common/components/user/avatar.dart';
import 'package:mobile/common/theme/color_palette.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: GreyPalette.borderGrey))),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(IconPaths.cheveronLeft),
              ),
              const SizedBox(width: 16.0),
              const Avatar(
                imageSrc:
                    "https://s1.ticketm.net/dam/a/ee1/a8628e68-05a5-4cef-a1b5-aa2650058ee1_1688761_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                size: AvatarSize.small,
              ),
              const SizedBox(width: 16.0),
              const Text(
                "Oli Sykes",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SvgPicture.asset(IconPaths.settings)
        ],
      ),
    );
  }
}
