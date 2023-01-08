import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/common/components/user/avatar.dart';

class NewMatchesList extends StatelessWidget {
  const NewMatchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            localizations.inbox_new_matches,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 102,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: index == 0 ? 16.0 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Avatar(
                    imageSrc:
                        "https://s1.ticketm.net/dam/a/ee1/a8628e68-05a5-4cef-a1b5-aa2650058ee1_1688761_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                  ),
                  SizedBox(height: 4.0),
                  SizedBox(
                    width: 64,
                    child: Text(
                      "Oli Sykes",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
