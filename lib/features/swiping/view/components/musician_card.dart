import 'package:flutter/material.dart';

import 'package:mobile/core/models/musician/musician.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard({super.key, required this.musician});

  final Musician musician;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(musician.name.firstName),
    );
  }
}
