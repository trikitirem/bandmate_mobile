import 'package:flutter/material.dart';
import 'package:mobile/common/components/input/multi_select/multi_select.dart';
import 'package:mobile/common/components/input/text_area.dart';
import 'package:mobile/common/components/text/error_message.dart';
import 'package:mobile/features/home/view/home_screen.dart';
import 'package:mobile/features/register/types/lists.dart';
import 'package:provider/provider.dart';
import '../../../../common/components/input/button.dart';
import '../../provider/register_provider.dart';
import '../../types/steps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterStep2 extends StatelessWidget {
  const RegisterStep2({super.key, required this.setStep});

  final void Function(RegisterSteps nextStep) setStep;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final registerProvider = context.watch<RegisterProvider>();
    final form = registerProvider.form;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                localizations.register_step2_title,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                localizations.register_step2_description,
                style: const TextStyle(color: Colors.black54),
              ),
              TextArea(
                hintText: localizations.register_step2_description_hint,
                onChanged: (value) => form.about.description = value,
                initialValue: form.about.description,
              ),
              const SizedBox(height: 48.0),
              Text(
                localizations.register_step2_music_about,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 24.0),
              Text(
                localizations.register_step2_music_about_instruments,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 12.0),
              MultiSelect(
                items: instrumentList,
                selectedItems: form.about.instruments,
                onClick: (newInstruments) =>
                    registerProvider.setInstruments(newInstruments),
              ),
              const SizedBox(height: 24.0),
              Text(
                localizations.register_step2_music_about_genres,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 12.0),
              MultiSelect(
                items: genreList,
                selectedItems: form.about.genres,
                onClick: (newGenres) => registerProvider.setGenres(newGenres),
              ),
              ErrorMessage(
                errorMessage: registerProvider.errorMessage,
              ),
              const SizedBox(
                height: 48.0,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Button(
                  onClick: () => setStep(RegisterSteps.step1),
                  label: "<-",
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Button(
                    label: registerProvider.loading == true
                        ? localizations.common_loading
                        : localizations.register_step2_submit,
                    onClick: () => registerProvider.register(() =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            HomeScreen.path, (route) => false)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
