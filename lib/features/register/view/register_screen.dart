import 'package:flutter/material.dart';
import 'package:mobile/features/register/types/steps.dart';
import 'package:mobile/features/register/view/subview/step1.dart';
import 'package:mobile/features/register/view/subview/step2.dart';
import '../provider/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String path = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var currentStep = RegisterSteps.step1;

  void setStep(RegisterSteps nextStep) {
    setState(() {
      currentStep = nextStep;
    });
  }

  Widget buildLayout() {
    switch (currentStep) {
      case RegisterSteps.step1:
        return RegisterStep1(setStep: setStep);
      case RegisterSteps.step2:
        return RegisterStep2(setStep: setStep);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => RegisterProvider(context),
          child: buildLayout(),
        ),
      ),
    );
  }
}
