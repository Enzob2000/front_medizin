import 'package:flutter/material.dart';
import 'package:front_medizin/menudesplegado.dart';
import 'home.dart';

void main() {
  runApp(const Ayuda());
}

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

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
        leadingWidth: 95,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
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
            padding: const EdgeInsets.only(top: 0.0, right: 60.0),
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
            padding: const EdgeInsets.only(top: 25.0, left: 0.0),
            child: Text(
            'Centro de Ayuda',
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
              icon: Icon(Icons.help_outline_rounded, color: Color.fromARGB(255, 67, 67, 67),size: 25,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      
      body:  Padding(
        
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Expanded(
              child: ListView(
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
              ),
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

Widget _buildTextField(String label, String value,String num) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
        
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 114, 109, 109),
            fontWeight: FontWeight.w600,
          ),
        ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 114, 109, 109),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 227, 227, 227),
            filled: true,
            hintText: value,
            hintStyle: TextStyle(color: Color.fromARGB(255, 114, 109, 109)),
            suffixIcon: IconButton(
              icon: 
              Icon(Icons.visibility_off_outlined, color: Color.fromARGB(255, 114, 109, 109),size: 25),
              onPressed: () {},
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 22),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(19),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(19),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
