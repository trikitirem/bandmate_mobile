import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/common/components/input/button.dart';
import 'package:mobile/common/components/user/avatar.dart';
import '../../../../common/models/musician/musician.dart';

class ItsAMatch extends StatelessWidget {
  const ItsAMatch({super.key, required this.match});

  final Musician match;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Text(
            localizations.swiping_match_title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40.0,
              fontFamily: "Shadows",
            ),
          ),
          const SizedBox(height: 32.0),
          const Avatar(
              imageSrc:
                  "https://s1.ticketm.net/dam/a/ee1/a8628e68-05a5-4cef-a1b5-aa2650058ee1_1688761_TABLET_LANDSCAPE_LARGE_16_9.jpg"),
          const SizedBox(height: 16.0),
          RichText(
            text: TextSpan(
              text: localizations.swiping_match_you_matched,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: match.name.firstName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Button(
            onClick: () {},
            label: localizations.swiping_match_write_message,
          )
        ],
      ),
    );
  }
}
