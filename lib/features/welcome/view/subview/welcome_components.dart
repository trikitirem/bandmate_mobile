import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import '../../../home/view/home_screen.dart';
import '../../provider/welcome_provider.dart';
import 'user_not_present.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeComponent extends StatefulWidget {
  const WelcomeComponent({super.key});

  @override
  State<WelcomeComponent> createState() => _WelcomeComponentState();
}

class _WelcomeComponentState extends State<WelcomeComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WelcomeProvider>().welcome(() {
        if (!mounted) {
          return;
        }
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.path, (route) => false);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final welcomeProvider = context.watch<WelcomeProvider>();
    final localizations = AppLocalizations.of(context)!;

    if (welcomeProvider.loading) {
      return Center(
        child: Text(localizations.common_loading),
      );
    }

    if (welcomeProvider.errorMessage != null) {
      return const UserNotPresent();
    }

    return Container();
  }
}
