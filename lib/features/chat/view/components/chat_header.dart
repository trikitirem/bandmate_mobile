import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:mobile/common/components/user/avatar.dart';
import 'package:mobile/common/theme/color_palette.dart';
import 'package:mobile/features/chat/view/chat_options_scren.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key, this.showOptionsButton});

  final bool? showOptionsButton;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.75,
      child: Container(
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
            showOptionsButton == true
                ? GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatOptionsScreen(),
                          ),
                        ),
                    child: SvgPicture.asset(IconPaths.settings))
                : Container()
          ],
        ),
      ),
    );
  }
}
