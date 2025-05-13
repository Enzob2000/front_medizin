import 'package:flutter/material.dart';
import 'package:front_medizin/home.dart';
import 'ingresarnumero.dart';
import 'iniciarsesion/iniciarsesion.dart';

void main() {
  runApp(Exitoso());
}

class Exitoso extends StatelessWidget {
  const Exitoso({super.key});

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
                margin: const EdgeInsets.only(top: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: <Widget>[
                      
                      Center(child: 
                      Image.asset('assets/pagoexitoso.png', width: 272, height: 240,),
                      ),
                       SizedBox(height: 30.0),
                       Text(
                        'Su pedido ha sido aceptado',
                        style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                       ),
                       SizedBox(height: 30.0),
                       Text(
                        'Sus artículos han sido colocados y están\nen camino a ser procesados',
                        style: TextStyle(color: Color.fromARGB(255, 67, 67, 67),fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                       ),
                        SizedBox(height: 80.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),  // Margen izquierdo y derecho
  child: SizedBox(
    width: double.infinity,  // Ocupa todo el ancho disponible
    height: 60.0,
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
        'Ir al chat',
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
                                text: 'Volver al inicio',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
              
          ],
        ),
      ),
    );
  }
}