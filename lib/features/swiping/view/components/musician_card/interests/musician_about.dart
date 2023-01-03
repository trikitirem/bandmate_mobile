import 'package:flutter/material.dart';
import 'package:mobile/core/models/musician/name.dart';
import 'package:mobile/features/swiping/view/components/musician_card/interests/interests_row.dart';

import '../../../../../../core/models/musician/about.dart';

class MusicianAbout extends StatelessWidget {
  const MusicianAbout({
    super.key,
    required this.about,
    required this.name,
  });

  final About about;
  final Name name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${name.firstName} ${name.lastName ?? ""}",
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 16.0),
          about.description != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    about.description!,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                )
              : Container(),
          InterestsRow(items: about.instruments),
          const SizedBox(height: 8.0),
          InterestsRow(items: about.genres),
        ],
      ),
    );
  }
}
