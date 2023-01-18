import 'package:flutter/material.dart';
import 'package:mobile/features/swiping/provider/judging_provider.dart';
import 'package:mobile/features/swiping/view/subview/its_a_match.dart';
import 'package:mobile/features/swiping/view/subview/swiping.dart';
import 'package:provider/provider.dart';
import '../../../common/models/musician/musician.dart';
import '../provider/swiping_provider.dart';

class SwipingWidget extends StatefulWidget {
  const SwipingWidget({super.key});

  @override
  State<SwipingWidget> createState() => _SwipingWidgetState();
}

class _SwipingWidgetState extends State<SwipingWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final swipingProvider = context.read<SwipingProvider>();
      if (swipingProvider.swipes == null) {
        swipingProvider.loadSwipes();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (context) {
            final swipingProvider = context.watch<SwipingProvider>();

            if (swipingProvider.loading) {
              return const Center(child: Text("Loading..."));
            }

            if (swipingProvider.errorMessage != null) {
              return Center(child: Text(swipingProvider.errorMessage!));
            }

            return const Swiping();
          },
        ),
        //ItsAMatch(match: context.read<SwipingProvider>().swipes![0]),
        StreamBuilder(
          stream: context.read<JudgingProvider>().matchStream,
          builder: (context, AsyncSnapshot<Musician> snapshot) {
            if (snapshot.data != null) {
              return ItsAMatch(match: snapshot.data!);
            }

            return Container();
          },
        ),
        StreamBuilder(
          stream: context.read<JudgingProvider>().errorStream,
          builder: (consext, snapshot) {
            return Container();
          },
        )
      ],
    );
  }
}
