
import 'package:flutter/material.dart';
import 'home.dart';
import 'producto.dart';

void main() {
  runApp(const Busqueda2());
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
final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];
class Busqueda2 extends StatelessWidget {
   
   const Busqueda2({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Medicamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: const MedicineSearchScreen2(),
    );
  }
}

class MedicineSearchScreen2 extends StatefulWidget {
  final String? query;
  const MedicineSearchScreen2({super.key,
    this.query});
  
  @override
  State<MedicineSearchScreen2> createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen2> {
  late TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode(); 
  final List<Product> products = const [
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 650Mg X10 Tabletas', imagePath: 'assets/acetaminofen_650mg.png', link: 'Farmacia()', precioAnt: 'Bs. 50,99',precioDesc: 'Bs. 35,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 500mg 10Tabletas Genven', imagePath: 'assets/acetaminofen_500mg.png', link: '', precioAnt: 'Bs. 60,99',precioDesc: 'Bs. 45,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    ];


  
  List<String> _filteredMedicines = [];

  @override
 @override
void initState() {
  super.initState();
  // Inicializa el controlador PRIMERO con el valor del query
  _searchController = TextEditingController(text: widget.query ?? '');
  
  // Luego configura el listener
  
  
  // Finalmente filtra los resultados iniciales
 
 

  WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
}


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
     _focusNode.dispose(); 
  }

  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  
  final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];


  List<String> _resultados = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Image.asset(
            'assets/logo.png',
            height: 80.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 5.0),
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Color.fromARGB(255, 0, 87, 255),
                  ),SizedBox(width: 4),
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
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 35),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 87, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                hintText: 'Buscar medicamento...',
                                suffixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 67, 67, 67)),
                                filled: true,
                                
                                fillColor: Colors.grey[100],
                                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color.fromARGB(255, 197, 197, 197), width: 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.tune, color: Colors.white, size: 26),
                              onPressed: () {
                                // Acción del filtro
                              },
                              padding: const EdgeInsets.all(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.64
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child:  _buildProductCard(products[index],context),
                              );
                            },
                          ),
                        ),
                  ],
                ),
              ),
            ),
          )
              ],
      ),
      bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.white, // Color de fondo principal
    border: Border.all(color: Colors.black, width: 1.0),
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
    child: Theme(
      data: Theme.of(context).copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent, // ¡Clave!
        ),
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
),),);
    
  }
}

final List<BottomNavigationBarItem> _menuItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'Categoría',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: 'Favoritos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.credit_card_outlined),
      label: 'Creditos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.monitor_heart_outlined),
      label: 'Servicios',
    ),
  ];


   Widget _buildProductCard(Product product, context) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.grey[300]!,
        width: 1,
      )
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Producto()),
                  );
      },
      child: Padding(
  padding: const EdgeInsets.all(6),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Contenedor de la imagen con corazón
      Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 1,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 0, 87, 255),
                    size: 20,
                  ),
                  onPressed: () {
                    // Lógica para marcar como favorito
                  },
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(5, 5),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 2),
      
      // Información del producto
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.categoria,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 0),
          
          // Precios y botón de añadir
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[700],
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: [
                        TextSpan(
                          text: "${product.precioAnt}\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 139, 139, 139),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: product.precioDesc,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 0, 87, 255),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  print("Producto añadido");
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
),
    ),
  );
}