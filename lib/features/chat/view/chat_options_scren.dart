import 'package:flutter/material.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:mobile/features/chat/models/chat_option.dart';
import 'package:mobile/features/chat/view/components/chat_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/features/chat/view/components/chat_option.dart';

class ChatOptionsScreen extends StatelessWidget {
  const ChatOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final List<ChatOption> options = [
      ChatOption(
          iconPath: IconPaths.bell,
          label: localizations.chat_options_notifications),
      ChatOption(
          iconPath: IconPaths.remove,
          label: localizations.chat_options_block,
          type: ChatOptionType.warning),
      ChatOption(
          iconPath: IconPaths.shield,
          label: localizations.chat_options_report,
          type: ChatOptionType.warning),
      ChatOption(
          iconPath: IconPaths.closeRing,
          label: localizations.chat_options_unmatch,
          type: ChatOptionType.warning)
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ChatHeader(),
            ...[
              for (var option in options)
                ChatOptionWidget(
                  option: option,
                )
            ]
          ],
        ),
      ),
    );
  }
}
