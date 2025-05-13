import 'package:flutter/material.dart';
import 'package:front_medizin/ayuda/ayuda.dart';
import 'home.dart';
import 'miscompras.dart';
import 'misdatos.dart';
import 'midireccion.dart';
import 'cambiarcontraseña.dart';
import 'notificaciones.dart';

void main() {
  runApp(const MenuD());
}

class MenuD extends StatelessWidget {
  const MenuD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: const SearchScreen(),
    );
  }
}

class Product {
  final String name,imagePath,link,categoria,precioAnt,
  precioDesc;

  const Product({
    required this.name,
    required this.imagePath,
    required this.link,
    required this.categoria,
    required this.precioAnt,
    required this.precioDesc,
  });
}

class Category {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  
  final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];

  final List<Product> products = const [
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 650Mg X10 Tabletas', imagePath: 'assets/acetaminofen_650mg.png', link: 'Farmacia()', precioAnt: 'Bs. 50,99',precioDesc: 'Bs. 35,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 500mg 10Tabletas Genven', imagePath: 'assets/acetaminofen_500mg.png', link: '', precioAnt: 'Bs. 60,99',precioDesc: 'Bs. 45,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    ];



Color getcolor(int index) {
    return _currentIndex == index ? Color.fromARGB(255,0,87,255) : Color.fromARGB(255, 67, 67, 67);
  }

  List<BottomNavigationBarItem> get _menuItems {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/inicio.png',
          width: 24,
          height: 24,
          color: getcolor(0),
        ),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/categoria.png', width: 24, height: 24,
        color: getcolor(1)),
        label: 'Categoría',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/favoritos.png', width: 24, height: 24,
        color: getcolor(2)),
        label: 'Favoritos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/creditos.png', width: 24, height: 24,
        color: getcolor(3)),
        label: 'Creditos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/servicios.png', width: 24, height: 24,
        color: getcolor(4)),
        label: 'Servicios',
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  automaticallyImplyLeading: false, // Elimina el ícono de retroceso por defecto
  titleSpacing: 0, // Elimina el espacio adicional del título
  leadingWidth: 100,
  toolbarHeight: 60.0, // Ancho personalizado para el leading
  leading: Padding(
    padding: const EdgeInsets.only(left: 16.0), // Ajuste de padding izquierdo
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homes()),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            size: 16,
            color: Color.fromARGB(255, 0, 87, 255),
          ),
          SizedBox(width: 4),
          Text(
            'Volver',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 87, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  ),
),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del usuario
             Container(
              child: Row(
                children: [
                  Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0), // Space between items
              child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset(
                        'assets/foto.png',
                        width: 74,  // Explicit width
                        height: 74, // Matches height to make square
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,width: 0,),
                  
                  Padding(
  padding: const EdgeInsets.only(right: 15.0, bottom: 8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
      children: [ Text(
        "John Smith",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 67, 67, 67),
      ),),
      SizedBox(width: 5), 
      TextButton.icon(
                        icon: Icon(Icons.edit_outlined, color: Color.fromARGB(255, 0, 87, 255), size: 24,),
                        
                        label: Text('', 
                             style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
                        onPressed: () {
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Elimina el padding horizontal y vertical
                          minimumSize: Size.zero,tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           visualDensity: VisualDensity.compact,
                        ),
                      ),
      ],
      ),
      const SizedBox(height: 0), // Espacio entre nombre y correo
      Text(
        'Johnsmith@gmail.com',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    ],
  ),
)
                  
                ],
              ),
            ),
            const SizedBox(height: 15),
            
            
            // Amoung us - Abraham*
            Expanded(
              child: ListView(
                children: [
                  const Divider(height: 7, thickness: 1),
                 ListTile(
                    title: Text("Mis compras",style: const TextStyle(color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/compras.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Compras()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Mis datos",style: const TextStyle( color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/datos.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Datos()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Mi dirección",style: const TextStyle(color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/direccion.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Direccion()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Mis créditos",style: const TextStyle( color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/creditos.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      // Navegar a la pantalla correspondiente
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Cambiar contraseña",style: const TextStyle( color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/contraseña.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CambiarC()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Notificaciones",style: const TextStyle( color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/notificaciones.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notificaciones()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Ayuda",style: const TextStyle(color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/ayuda.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ayuda()),
                      );
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                  ListTile(
                    title: Text("Acerda de",style: const TextStyle( color: Color.fromARGB(255, 67, 67, 67)),),
                    leading: Image.asset('assets/acerca.png', width: 24, height: 24),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                    onTap: () {
                      // Navegar a la pantalla correspondiente
                    },
                  ),
                  const Divider(height: 7, thickness: 1),
                ],
              ),
            ),
            SizedBox(height: 15,),
            // Botón de Cerrar Sesión
            Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: () {
        
      },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 37),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          backgroundColor: Color.fromARGB(255, 0, 87, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.logout_outlined,color: Colors.white,size: 24,),
                const SizedBox(width: 55),
                Text(
                  "Cerrar Sesión",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            //top: BorderSide(color: Colors.black, width: 1.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10.0,
              offset: Offset(0, -2)
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
          child: BottomNavigationBar(
            items: _menuItems,
            currentIndex: _currentIndex,
            selectedItemColor: Color.fromARGB(255, 0, 87, 255),
            unselectedItemColor: Color.fromARGB(255, 67, 67, 67),
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}