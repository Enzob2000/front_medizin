import 'package:flutter/material.dart';
import 'registro.dart';
void main() {
  runApp(Inicio ());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
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
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  elevation: 0, // Elimina la sombra del AppBar
  automaticallyImplyLeading: false, // Oculta el botón de retroceso si no es necesario
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 25.0,top: 35.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          // Lógica para saltar
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Saltar',
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 0, 87, 255),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.arrow_forward,
              size: 16,
              color: Color.fromARGB(255, 0, 87, 255),
            ),
          ],
        ),
      ),
    ),
  ],
),
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: Padding(
        
        padding: const EdgeInsets.all(0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.only(top: 85.0,left: 45.0, right: 45.0),
              child: Image.asset(
                'assets/logo.png', // Ruta corregida
                width: 200,
                fit: BoxFit.contain, // Cambiado a contain para mejor visualización
              ),
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 105.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 217, 236),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
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
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 20.0),
                    child: Text(
                      'Regístrate en la App y disfruta de una increíble experiencia de compra, la salud a un solo clic.',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 45, 59, 142)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                      
                      SizedBox(height: 20.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),
  child: SizedBox(
    width: double.infinity,
    height: 67.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InicioScreen()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => const Color.fromARGB(255, 0, 87, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
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
        'Registrarme',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  ),
),                   
SizedBox(height: 10.0),
             Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),
  child: SizedBox(
    width: double.infinity,
    height: 67.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InicioScreen()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => const Color.fromARGB(255, 30, 217, 236),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
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
        'Iniciar Sesión',
        style: TextStyle(
          fontSize: 18.0,
          color: Color.fromARGB(255, 45, 59, 142),
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