
import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/Inicio/presentation/widgets/auth/auth_button.dart';

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 20.0),
              child: Text(
                'Regístrate en la App y disfruta de una increíble experiencia de compra, la salud a un solo clic.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 45, 59, 142),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20.0),
            AuthButton(
              text: 'Registrarme',
              backgroundColor: const Color.fromARGB(255, 0, 87, 255),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.register);
              },
            ),
            const SizedBox(height: 10.0),
            AuthButton(
              text: 'Iniciar Sesión',
              backgroundColor: const Color.fromARGB(255, 30, 217, 236),
              textColor: const Color.fromARGB(255, 45, 59, 142),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRouter.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
