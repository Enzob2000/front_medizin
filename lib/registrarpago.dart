import 'dart:ui';

import 'package:flutter/material.dart';
import 'ingresarnumero.dart';
import 'iniciarsesion.dart';

void main() {
  runApp(RegistrarPago());
}

class RegistrarPago extends StatelessWidget {
  const RegistrarPago({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      theme: ThemeData(fontFamily: 'Poppins',),
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
                      'Registrar pago móvil',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700,
                      color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                      'Disfruta de una increíble experiencia de compra, la salud a un solo clic.',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 45, 59, 142)),
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
                          hintText: 'Titular de la cuenta',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Numero de Telf. del Pago Movil',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Cédula o Rif',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Banco emisor',
                          hintStyle: TextStyle(color: Colors.grey[400]), 
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),

                      Container(
                        width: 242,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                          
                        },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 37),
                            side: BorderSide(color: Color.fromARGB(255, 0, 87, 255), // Color azul
                          width: 1.5, ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),


                            backgroundColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/subirarchivo.png', width: 20, height: 20,),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Subir Archivo",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 87, 255),
                                      fontWeight: FontWeight.w600
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
SizedBox(height: 20.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),  // Margen izquierdo y derecho
  child: SizedBox(
    width: double.infinity,  // Ocupa todo el ancho disponible
    height: 65.0,
    child: ElevatedButton(
       onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Numero()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 0, 87, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
      ),
      child: Text(
        'Verificar',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  ),
),                    SizedBox(height: 30.0),
                      TextButton(
                        onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InicioSesion()),
                            );*/
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 67, 67, 67), // Color base del texto
                            ),
                            children: [
                              TextSpan(text: 'Contactar a soporte'),
                              
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