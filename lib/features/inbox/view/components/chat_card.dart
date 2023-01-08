import 'package:flutter/material.dart';
import 'package:mobile/common/components/user/avatar.dart';
import 'package:mobile/common/theme/color_palette.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Avatar(
            imageSrc:
                "https://s1.ticketm.net/dam/a/ee1/a8628e68-05a5-4cef-a1b5-aa2650058ee1_1688761_TABLET_LANDSCAPE_LARGE_16_9.jpg"),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Oli Sykes",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "Hey! Wanna join a band? : 3min",
                style: TextStyle(
                  color: GreyPalette.textGrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
