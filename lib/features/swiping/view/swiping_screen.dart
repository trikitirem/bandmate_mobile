import 'package:flutter/material.dart';
import 'package:mobile/features/swiping/provider/judging_provider.dart';
import 'package:mobile/features/swiping/view/swiping_widget.dart';
import 'package:provider/provider.dart';

import '../provider/swiping_provider.dart';

class SwipingScreen extends StatelessWidget {
  const SwipingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SwipingProvider()),
        ChangeNotifierProvider(create: (_) => JudgingProvider()),
      ],
      child: const SwipingWidget(),
    );
  }
}
