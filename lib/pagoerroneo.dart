import 'package:flutter/material.dart';
import 'package:front_medizin/home.dart';
import 'package:front_medizin/pagoexitoso.dart';
import 'ingresarnumero.dart';
import 'iniciarsesion.dart';

void main() {
  runApp(Erroneo());
}

class Erroneo extends StatelessWidget {
  const Erroneo({super.key});

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
            
            SizedBox(height:50.0),
             Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 0.0,left: 20,right: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(18),
                ),
                
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              
                              IconButton(
                                icon: Icon(Icons.close, color: Color.fromARGB(255, 24, 23, 37),size: 30,),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      
                      SizedBox(height: 0.0),
                      Center(child: 
                      Image.asset('assets/error.png', width: 222, height: 221,),
                      ),
                       SizedBox(height: 0.0),
                       Text(
                        'Uups!\nError en el pago',
                        style: TextStyle(color: Color.fromARGB(255, 0, 87, 255),fontSize: 30, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                       ),
                       SizedBox(height: 20.0),
                       Text(
                        '¡Por favor, verifica los datos del pago realizado y vuelve a intentarlo!',
                        style: TextStyle(color: Color.fromARGB(255, 67, 67, 67),fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                       ),
                        SizedBox(height: 20.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),  // Margen izquierdo y derecho
  child: SizedBox(
    width: double.infinity,  // Ocupa todo el ancho disponible
    height: 60.0,
    child: ElevatedButton(
       onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Exitoso()),
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
        'Volver a intentar',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homes()),
                            );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600], // Color base del texto
                            ),
                            children: [
                              
                              TextSpan(
                                text: 'Ir al inicio',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 81, 110, 250),
                                  fontSize: 18// Color para el texto clickeable
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
              SizedBox(height: 50),
              Center( 
                child: Text('Contactar a soporte',
                style: TextStyle(fontSize: 14,fontWeight:FontWeight.w400, color: Color.fromARGB(255, 67, 67, 67))),
              ),
          ],
        ),
      ),
    );
  }
}