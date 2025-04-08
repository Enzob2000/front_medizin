import 'package:flutter/material.dart';
import 'inicio.dart';
void main() {
  runApp(InicioScreen ());
}

class InicioScreen  extends StatelessWidget {
  const InicioScreen ({super.key});

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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: Padding(
        
        padding: const EdgeInsets.all(0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
  alignment: Alignment.centerRight,
  child: Padding(
    padding: const EdgeInsets.only(right: 45.0),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // Elimina el padding interno del botón
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce el área clickeable
      ),
      onPressed: () {
        // Lógica para saltar
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // Importante para que no ocupe todo el ancho
        mainAxisAlignment: MainAxisAlignment.end, // Alinea el contenido a la derecha
        children: [
          Text(
            'Saltar',
            style: TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 0, 87, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 4), // Espacio pequeño entre texto e ícono
          Icon(
            Icons.arrow_forward,
            size: 16,
            color: Color.fromARGB(255, 0, 87, 255),
          ),
        ],
      ),
    ),
  ),
),
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
                      Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 20.0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,color: Colors.white,),
                      textAlign: TextAlign.left,
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
                      
                      SizedBox(height: 30.0),
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0),  // Margen izquierdo y derecho
  child:SizedBox(
  width: double.infinity,
  height: 67.0,
  child: ElevatedButton(
    onPressed: isChecked
        ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }
          : null,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          
          return Color.fromARGB(255, 0, 87, 255); // Color normal y presionado
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Color.fromARGB(255, 0, 87, 255).withOpacity(0.8); // Efecto al presionar
          }
          return Colors.transparent; // Sin efecto adicional
        },
      ),
    ),
    child: Text(
      'Registrarme',
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    ),
  ),
),
),                    SizedBox(height: 10.0),
                      
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