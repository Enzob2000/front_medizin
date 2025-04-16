import 'package:flutter/material.dart';
import 'verificarnumero.dart';
void main() {
  runApp(Numero());
}

class Numero extends StatelessWidget {
  const Numero({super.key});

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
          backgroundColor: Color.fromARGB(255, 30, 217, 236),
          elevation: 0, // Elimina la sombra
          toolbarHeight: 140, // Aumenta la altura del AppBar para acomodar el logo
          title: Padding(
            padding: const EdgeInsets.only(top: 122.0,bottom: 50.0),
            child: Image.asset(
              'assets/logoblanco.png',
              width: 251,
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: true, // Centra el logo horizontalmente
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
                  
                ],
              ),
            ),
            SizedBox(height: 60.0),
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
                      Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                      'Verificar número \nde Teléfono',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                      'Le enviaremos un mensaje SMS por única vez. Pueden aplicarse tarifas del operador.',
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400,color: Color.fromARGB(255, 128, 124, 124)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
                      
                      SizedBox(height: 20.0),
  TextField(
    
  decoration: InputDecoration(
    
    hintText: 'Ingresa tu número',
    contentPadding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 20.0),
    filled: true,
    fillColor: Colors.grey[200],
    hintStyle: TextStyle(color: Colors.grey[500]), 
    border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
    prefixIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Image.asset(
            'assets/bandera.png', // Tu imagen de bandera
            width: 24,
            height: 16,
          ),
        ),
        Container(
          height: 35,
          width: 1,
          color: Colors.grey[400],
          margin: const EdgeInsets.only(right: 12),
        ),
      ],
    ),
    
    
  ),
  keyboardType: TextInputType.phone,
),
                      SizedBox(height: 50.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),
  child: SizedBox(
    width: double.infinity,
    height: 67.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Verificar()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => const Color.fromARGB(255, 0, 87, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return states.contains(MaterialState.pressed)
              ? const Color.fromARGB(255, 0, 87, 255).withOpacity(0.8)
              : Colors.transparent;
          },
        ),
      ),
      child: const Text(
        'Enviar Código',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
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