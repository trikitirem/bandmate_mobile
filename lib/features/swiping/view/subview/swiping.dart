import 'package:flutter/material.dart';
import 'package:mobile/features/swiping/view/components/musician_card.dart';
import 'package:mobile/features/swiping/view/components/swipes_list_empty.dart';
import 'package:provider/provider.dart';

import '../../provider/swiping_provider.dart';

class Swiping extends StatelessWidget {
  const Swiping({super.key});

  @override
  Widget build(BuildContext context) {
    final swipesProvider = context.watch<SwipingProvider>();

    if (swipesProvider.swipes == null || swipesProvider.swipes!.isEmpty) {
      return const SwipesListEmpty();
    }

    return MusicianCard(musician: swipesProvider.swipes![0]);
  }
}
