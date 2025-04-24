import 'package:flutter/material.dart';
import 'package:front_medizin/menudesplegado.dart';
import 'home.dart';

void main() {
  runApp(const CambiarC());
}

class CambiarC extends StatelessWidget {
  const CambiarC({super.key});

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
        leadingWidth: 85,
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
            padding: const EdgeInsets.only(top: 25.0, left: 0.0),
            child: Text(
            'Cambiar Contraseña',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 87, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          
        ],
      ),
      
      body:  Padding(
        
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [SizedBox(height: 20),
            _buildTextField('Contraseña Actual:', 'Ingresa contraseña actual','1'),
            const SizedBox(height: 20),
            _buildTextField('Nueva Contraseña', 'Ingresa nueva contraseña','2'),
            const SizedBox(height: 20),
            _buildTextField('Confirmar Contraseña', 'Ingresa contraseña nuevamente','1'),
            const SizedBox(height: 30),
            SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homes()),
                          );*/
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 87, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                          ),
                        ),
                        
                        child: const Text(
                          'Cambiar contraseña',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(child: TextButton(
                        onPressed: () {
                       /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorias()),
                      );*/
                    },
                    child: Text("Olvide mi contraseña",
                        style: const TextStyle(
                          fontSize: 14,decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 114, 109, 109)
                        ),
                      ),
                      ),)
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
