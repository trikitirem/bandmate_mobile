import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:mobile/common/components/input/form_text_input.dart';
import 'package:mobile/common/theme/color_palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: GreyPalette.backgroundGrey))),
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
      child: Row(
        children: [
          Flexible(
            child: FormTextInput(
              onChanged: (message) {},
              hintText: localizations.chat_input_hint,
            ),
          ),
          const SizedBox(width: 16.0),
          SvgPicture.asset(IconPaths.send)
        ],
      ),
    );
  }
}
