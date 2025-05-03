import 'package:flutter/material.dart';

class Cuerpo extends StatelessWidget {
  const Cuerpo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(19), // Bordes redondeados
                ),
                margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
                padding: EdgeInsets.only(top: 6, bottom: 6, right: 15, left: 15), // Espaciado vertical
              child:ListTile(
                title: Text("Contactar a Soporte",style: const TextStyle( color: Color.fromARGB(255, 0, 87, 255), fontSize: 18)),
                trailing: Image.asset('assets/contactar.png', width: 18, height: 18,),
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Compras()),
                  );*/
                },
              ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.circular(19), // Bordes redondeados
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.only(top: 6, bottom: 6, right: 15, left: 15), // Espaciado vertical
                  child:ListTile(
                      title: Text("Problemas al comprar",style: const TextStyle( color: Color.fromARGB(255, 0, 87, 255), fontSize: 18)),
                      trailing: const Icon(Icons.info_outline_rounded, color: Color.fromARGB(255, 0, 87, 255)),
                      onTap: () {
                        // Navegar a la pantalla correspondiente
                      },
                    ),
                ),
    
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(19), // Bordes redondeados
                ),
                margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
                padding: EdgeInsets.only(top: 6, bottom: 6, right: 15, left: 15), // Espaciado vertical
                child:ListTile(
                title: Text("Ayuda con mi cuenta",style: const TextStyle( color: Color.fromARGB(255, 0, 87, 255), fontSize: 18)),
                trailing: const Icon(Icons.info_outline_rounded, color: Color.fromARGB(255, 0, 87, 255),),
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Direccion()),
                  );*/
                },
              ),
              ),
            ],
          );
  }
}