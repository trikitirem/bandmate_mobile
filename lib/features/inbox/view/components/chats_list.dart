import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/common/theme/color_palette.dart';
import 'package:mobile/features/inbox/view/components/chat_card.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  List<Widget> getnerateChats() => [
        for (int i = 0; i < 15; i++)
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: ChatCard(),
          )
      ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                localizations.inbox_messages,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                "3${localizations.inbox_messages_new}",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: GreyPalette.textGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ...getnerateChats()
        ],
      ),
    );
  }
}
