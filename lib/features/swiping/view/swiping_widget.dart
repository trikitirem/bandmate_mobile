import 'package:flutter/material.dart';
import 'package:mobile/features/swiping/view/subview/swiping.dart';
import 'package:provider/provider.dart';

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
    final swipingProvider = context.watch<SwipingProvider>();

    if (swipingProvider.loading) {
      return const Center(child: Text("Loading..."));
    }

    if (swipingProvider.errorMessage != null) {
      return Center(child: Text(swipingProvider.errorMessage!));
    }

    return const Swiping();
  }
}
