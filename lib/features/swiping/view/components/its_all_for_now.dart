import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItsAllForNow extends StatelessWidget {
  const ItsAllForNow({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Center(
      child: Text(localizations.swiping_its_all_for_now),
    );
  }
}
