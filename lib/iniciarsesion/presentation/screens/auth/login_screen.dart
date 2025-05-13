
import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/presentation/widgets/auth/auth_button.dart';
import 'package:front_medizin/iniciarsesion/presentation/widgets/auth/social_button.dart';
import 'package:front_medizin/iniciarsesion/presentation/widgets/shared/divider_with_text.dart';
import 'package:front_medizin/registro/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 30, 217, 236),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 30, 217, 236),
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Disfruta de una increíble experiencia de compra, la salud a un solo clic.',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
            ),
            child: _LoginForm(),
          ),
        ),
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Correo electrónico',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                vertical: 19.0,
                horizontal: 24.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[200],
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility_off_outlined,
                  color: Color.fromARGB(255, 114, 109, 109),
                  size: 25,
                ),
                onPressed: () {},
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 19.0,
                horizontal: 24.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Olvidé mi contraseña',
                style: TextStyle(
                  color: Color.fromARGB(255, 67, 67, 67),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          AuthButton(
            text: 'Iniciar Sesión',
            backgroundColor: const Color.fromARGB(255, 0, 87, 255),
            textColor: Colors.white,
            onPressed: () {
              
            },
          ),
          const SizedBox(height: 20),
          const DividerWithText(text: 'Iniciar sesión con'),
          const SizedBox(height: 30),
          SocialButton(
            imagePath: 'assets/google.png',
            label: 'Continue with Google',
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          SocialButton(
            imagePath: 'assets/face.png',
            label: 'Continue with Facebook',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
