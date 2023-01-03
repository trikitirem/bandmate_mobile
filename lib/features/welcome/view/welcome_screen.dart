import 'package:flutter/material.dart';
import 'package:mobile/features/welcome/provider/welcome_provider.dart';
import 'package:mobile/features/welcome/view/subview/welcome_components.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String path = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => WelcomeProvider(context),
        child: const WelcomeComponent(),
      ),
    );
  }
}
