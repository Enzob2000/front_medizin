

import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/Inicio/presentation/widgets/auth/auth_button.dart';
import 'package:front_medizin/registro/presentation/providers/auth_provider.dart';
import 'package:front_medizin/registro/presentation/widgets/auth/auth_text_field.dart';
import 'package:front_medizin/registro/presentation/widgets/auth/terms_checkbox.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _termsAccepted = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 217, 236),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 30, 217, 236),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const _RegisterHeader(),
            Expanded(
              child: _RegisterForm(
                fullNameController: _fullNameController,
                emailController: _emailController,
                passwordController: _passwordController,
                termsAccepted: _termsAccepted,
                onTermsChanged:
                    (value) => setState(() => _termsAccepted = value),
                onRegister: () {
                  if (_formKey.currentState!.validate() && _termsAccepted) {
                    /*authProvider.register(
                      fullName: _fullNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );*/
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registrarme',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Disfruta de una increíble experiencia de compra, la salud a un solo clic.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool termsAccepted;
  final ValueChanged<bool> onTermsChanged;
  final VoidCallback onRegister;

  const _RegisterForm({
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.termsAccepted,
    required this.onTermsChanged,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthTextField(
              controller: fullNameController,
              hintText: 'Nombres y Apellidos',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu nombre completo';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AuthTextField(
              controller: emailController,
              hintText: 'Correo electrónico',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu correo';
                }
                if (!value.contains('@')) {
                  return 'Ingresa un correo válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AuthTextField(
              controller: passwordController,
              hintText: 'Contraseña',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una contraseña';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TermsCheckbox(value: termsAccepted, onChanged: onTermsChanged),
            const SizedBox(height: 30),
            AuthButton(
              text: 'Registrarme',
              onPressed: onRegister,
              backgroundColor: const Color.fromARGB(255, 0, 87, 255),
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.login);
              },
              child: RichText(
                text: const TextSpan(
                  text: '¿Ya tienes una cuenta? ',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
