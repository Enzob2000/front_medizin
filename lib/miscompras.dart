import 'package:flutter/material.dart';
import 'package:front_medizin/menudesplegado.dart';
import 'home.dart';

void main() {
  runApp(const Compras());
}

class Compras extends StatelessWidget {
  const Compras({super.key});

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

 


Color getcolor(int index) {
    return _currentIndex == index ? Colors.blue : Colors.grey;
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
        backgroundColor: Color.fromARGB(255, 242, 243, 242),
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
          child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuD()),
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
        
        actions: [
          
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Image.asset('assets/borrar.png', width: 24, height: 24,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del usuario
             
            const SizedBox(height: 15),
            
            
            // Amoung us - Abraham*
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245), // Fondo rojo claro (puedes ajustar el tono)
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      title: Text(
                        "Compra realizada",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 0, 87, 255),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "03/12",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 67, 67, 67)
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 1,
                            color: Colors.grey[400],
                            margin: const EdgeInsets.only(left: 12, right: 0),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {
                       /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorias()),
                      );*/
                    },
                    child: Text("Ver detalles",
                        style: const TextStyle(
                          fontSize: 10,decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 67, 67, 67)
                        ),
                      ),
                      ),
                      onTap: () {
                        // Navegar a la pantalla correspondiente
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245), // Fondo rojo claro (puedes ajustar el tono)
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      title: Text(
                        "Compra realizada",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 0, 87, 255),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "03/12",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 67, 67, 67)
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 1,
                            color: Colors.grey[400],
                            margin: const EdgeInsets.only(left: 12, right: 0),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {
                       /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorias()),
                      );*/
                    },
                    child: Text("Ver detalles",
                        style: const TextStyle(
                          fontSize: 10,decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 67, 67, 67)
                        ),
                      ),
                      ),
                      onTap: () {
                        // Navegar a la pantalla correspondiente
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245), // Fondo rojo claro (puedes ajustar el tono)
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      title: Text(
                        "Compra realizada",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 0, 87, 255),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "03/12",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 67, 67, 67)
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 1,
                            color: Colors.grey[400],
                            margin: const EdgeInsets.only(left: 12, right: 0),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {
                       /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorias()),
                      );*/
                    },
                    child: Text("Ver detalles",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 10,
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      ),
                      onTap: () {
                        // Navegar a la pantalla correspondiente
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 15,),
            // Botón de Cerrar Sesión
            Center(
            child: Text("Las ordenes tienes un plazo de 30 días \nen el historial, luego se eliminarán automáticamente",
                        style: const TextStyle(
                          
                          fontSize: 11,
                          color: Color.fromARGB(255, 114, 109, 109),
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
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
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
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