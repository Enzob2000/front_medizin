import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/Inicio/presentation/screens/welcome/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 35.0),
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.login),
              child: const Row(
                children: [Text('Saltar',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),), Icon(Icons.arrow_forward)],
              ),
            ),
          ),
        ],
      ),
      body: const WelcomeBody(),
    );
  }
}
