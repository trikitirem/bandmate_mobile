import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/assets/icons_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/common/components/input/form_text_input.dart';
import 'package:mobile/features/inbox/view/components/chats_list.dart';
import 'package:mobile/features/inbox/view/components/new_matches_list.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top + 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  localizations.inbox_title,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SvgPicture.asset(IconPaths.group)
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FormTextInput(
              onChanged: (search) {
                //TODO: search in contacts
              },
              icon: SvgPicture.asset(IconPaths.search),
              hintText: localizations.common_search,
            ),
          ),
          const SizedBox(height: 16.0),
          const NewMatchesList(),
          const SizedBox(height: 16.0),
          const ChatsList(),
        ],
      ),
    );
  }
}
