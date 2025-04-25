import 'package:flutter/material.dart';
import 'package:front_medizin/menudesplegado.dart';
import 'home.dart';

void main() {
  runApp(const Notificaciones());
}

class Notificaciones extends StatelessWidget {
  const Notificaciones({super.key});

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
      child:Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 40.0),
            child:
          Icon(
            Icons.arrow_back,
            size: 24,
            color: Color.fromARGB(255, 0, 87, 255),
          ),
      ),
    ),
        ),
        title:Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: Text(
            'Notificaciones',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 87, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Image.asset(
          'assets/settings.png',
          width: 24,
          height: 24,
          color: Color.fromARGB(255, 0, 87, 255),
        ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      
      body: Padding(

  padding: const EdgeInsets.only(left: 16.0, right: 16),
  child: ListView(
    children: [
      const SizedBox(height: 20),
      Container(
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 217, 217, 217),
    borderRadius: BorderRadius.circular(12), // Bordes redondeados
  ),
  margin: const EdgeInsets.symmetric(vertical: 4), // Espaciado vertical
  child: ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    title: RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
          fontFamily: 'Poppins',
        ),
        children: [
          const TextSpan(
            text: "Promoción \n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Color.fromARGB(255, 0, 87, 255),
              height: 1.4, // Ajuste de interlineado
            ),
          ),
          TextSpan(
            text: "Gana hasta 10\$ invitando a un amigo...",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: Colors.grey[700],
              height: 1.4, // Ajuste de interlineado
            ),
          ),
        ],
      ),
    ),
    trailing: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 0, 87, 255),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      onPressed: () {}, 
      child: const Text(
        'Ver más',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          fontSize: 12
        ),
      ),
    ),
    onTap: () {
      // Navegación
    },
  ),
),
      const SizedBox(height: 20),
      // Agrega aquí más ListTiles si necesitas
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

Widget _buildSocialButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 23),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                
                RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
              ),
              
              children: [
                TextSpan(
                  text: "Promoción \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 0, 87, 255),
                    fontFamily: 'Poppins',
                  ),
                ),
                TextSpan(
                  text: "Gana a hasta 10\$ invitando a un amigo...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 67, 67, 67),
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
                TextButton(
                child: Text('Ver más'),
                onPressed: () {},
              ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

