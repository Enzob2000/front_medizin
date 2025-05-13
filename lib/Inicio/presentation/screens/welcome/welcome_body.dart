import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/presentation/widgets/shared/app_logo.dart';
import 'package:front_medizin/Inicio/presentation/widgets/welcome/welcome_actions.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppLogo(),
          const SizedBox(height: 80.0),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 30, 217, 236),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              ),
              child: const WelcomeActions(),
            ),
          ),
        ],
      ),
    );
  }
}
