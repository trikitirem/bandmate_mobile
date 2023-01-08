import 'package:flutter/material.dart';
import 'package:mobile/common/models/musician/name.dart';
import 'package:mobile/features/swiping/view/components/musician_card/interests/interests_row.dart';

import '../../../../../../common/models/musician/about.dart';

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
          InterestsRow(items: about.instruments),
          const SizedBox(height: 8.0),
          InterestsRow(items: about.genres),
        ],
      ),
    );
  }
}
