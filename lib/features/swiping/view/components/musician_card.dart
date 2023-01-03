import 'package:flutter/material.dart';
import 'package:mobile/core/models/musician/musician.dart';
import 'package:mobile/features/swiping/provider/judging_provider.dart';
import 'package:mobile/features/swiping/view/components/musician_card/interests/musician_about.dart';
import 'package:mobile/features/swiping/view/components/musician_card/photos/musician_photos.dart';
import 'package:mobile/features/swiping/view/components/round_button.dart';
import 'package:provider/provider.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard({super.key, required this.musician});

  final Musician musician;

  @override
  Widget build(BuildContext context) {
    var judgingProvider = context.watch<JudgingProvider>();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: const MusicianPhotos(),
              ),
              MusicianAbout(about: musician.about, name: musician.name),
              const SizedBox(
                height: 76.0,
              )
            ],
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(
                      child: const Icon(
                        Icons.music_note,
                      ),
                      onClick: () => judgingProvider.like(),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    RoundButton(
                      child: const Icon(Icons.thumb_down_alt),
                      onClick: () => judgingProvider.dislike(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
