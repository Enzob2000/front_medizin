import 'package:flutter/material.dart';

void main() {
  runApp(InicioScreen());
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      theme: ThemeData(),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isChecked = false; // Estado para el checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 30, 217, 236),
      ),
      backgroundColor: Color.fromARGB(255, 30, 217, 236),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 30, 217, 236),
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                      'Registrarme',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                      'Disfruta de una increíble experiencia de compra, la salud a un solo clic.',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 0.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Nombres y Apellidos',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      return states.contains(WidgetState.selected) 
                                        ? Colors.black // Relleno negro cuando está seleccionado
                                        : Colors.transparent; // Transparente cuando no lo está
                                    }),
                                    checkColor: Colors.white, // Color del check (✓)
                                    side: BorderSide(
                                      color: Colors.black, // Borde negro siempre
                                      width: 1.5, // Grosor del borde
                                    ),
                                  ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                                  children: [
                                    TextSpan(text: 'Al continuar, aceptas nuestros '),
                                    TextSpan(
                                      text: 'términos de servicio ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'y Política de privacidad',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),

                                    ),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),  // Margen izquierdo y derecho
  child: SizedBox(
    width: double.infinity,  // Ocupa todo el ancho disponible
    height: 60.0,
    child: ElevatedButton(
      onPressed: isChecked
          ? () {
              
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 16, 16, 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
      ),
      child: Text(
        'Registrarme',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  ),
),                    SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          // Lógica para manejar el inicio de sesión
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600], // Color base del texto
                            ),
                            children: [
                              TextSpan(text: '¿Ya tienes una cuenta? '),
                              TextSpan(
                                text: 'Iniciar sesión',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Color para el texto clickeable
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}