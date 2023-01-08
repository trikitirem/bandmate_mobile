import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/components/input/button.dart';
import '../../../../common/components/input/form_text_input.dart';
import '../../../../common/components/text/error_message.dart';
import '../../provider/register_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../types/steps.dart';

class RegisterStep1 extends StatelessWidget {
  const RegisterStep1({super.key, required this.setStep});

  final void Function(RegisterSteps nextStep) setStep;

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();
    final form = registerProvider.form;
    final localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  localizations.register_step1_title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  localizations.register_step1_subtitle,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Text(
                  localizations.register_step1_names_title,
                  style: const TextStyle(color: Colors.black54),
                ),
                FormTextInput(
                  hintText: localizations.register_step1_names_firstname,
                  onChanged: (value) => form.name.firstName = value ?? "",
                  initialValue: form.name.firstName,
                ),
                FormTextInput(
                  hintText: localizations.register_step1_names_lastname,
                  onChanged: (value) => form.name.lastName = value,
                  initialValue: form.name.lastName,
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Text(
                  localizations.register_step1_auth_title,
                  style: const TextStyle(color: Colors.black54),
                ),
                FormTextInput(
                  hintText: localizations.register_step1_auth_email,
                  onChanged: (value) => form.contact.email = value ?? "",
                  initialValue: form.contact.email,
                ),
                FormTextInput(
                  hintText: localizations.register_step1_auth_password,
                  obscure: true,
                  onChanged: (value) => form.password = value ?? "",
                  initialValue: form.password,
                ),
                ErrorMessage(
                  errorMessage: registerProvider.errorMessage,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Button(
                label: localizations.common_next_step,
                onClick: () => setStep(RegisterSteps.step2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
