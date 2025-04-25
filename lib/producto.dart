import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Producto());
}

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
    this.minValue = 1,
    this.maxValue = 10,
    required this.onChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _increment() {
    setState(() {
      if (_currentValue < widget.maxValue) {
        _currentValue++;
        widget.onChanged(_currentValue);
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > widget.minValue) {
        _currentValue--;
        widget.onChanged(_currentValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botón - (izquierda)
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: _decrement,
            color: _currentValue <= widget.minValue ? Colors.grey : Color.fromARGB(255, 0, 87, 255),
          ),
          
          // Cantidad (centro)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$_currentValue',
              style: const TextStyle(fontSize: 18),
            ),
          ),
    
          // Botón + (derecha)
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: _increment,
            color: _currentValue >= widget.maxValue ? Colors.grey : Color.fromARGB(255, 0, 87, 255),
          ),
        ],
      ),
    );
  }
}

class Producto extends StatelessWidget {
  const Producto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicamento App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      home: const MedicineDetailScreen(),
    );
  }
}

class MedicineDetailScreen extends StatefulWidget {
  const MedicineDetailScreen({super.key});

  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);

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
        
        actions: [
          
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                  color: const Color.fromARGB(255, 242, 243, 242),
                ),
                
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  'assets/acetaminofen2.png',
                  width: double.maxFinite,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              
              // Contenido de información
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título y favorito
                    Row(
  children: [
    // Título expandible
    Expanded(
      child: const Text(
        'Acetaminofen 500mg \n10 tabletas Genven',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 87, 255),
        ),
      ),
    ),
    // IconButton sin Expanded
    IconButton(
      icon: const Icon(Icons.favorite_outline_outlined, 
        color: Color.fromARGB(255, 67, 67, 67)),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
      onPressed: () {},
    ),
  ],
),
                    const SizedBox(height: 6),
                    
                    // Uso (Dolor y fiebre)
                    const Text(
                      'Dolor y fiebre',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 76, 76, 76)
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Contador y precio
                    Row(
                      children: [
                        QuantitySelector(
                          initialValue: 1,
                          minValue: 1,
                          maxValue: 100,
                          onChanged: (value) {
                            print('Cantidad actual: $value');
                          },
                        ),
                        const Spacer(),
                        const Text('45,99 BsS',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 87, 255), 
                            fontSize: 22, 
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 32, thickness: 1),
                    
                    // Detalles del producto
                    Row(
                      children: [const Text(
                      'Detalles del producto',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 67, 67, 67)
                      ),
                    ),
                    Spacer(),
                    const Icon(
                          Icons.keyboard_arrow_down, 
                          color: Color.fromARGB(255, 0, 87, 255),
                          size: 24
                        ),
                    ],),
                    const SizedBox(height: 8),
                    const Text(
                      'El ibuprofeno reduce fiebre y alivia dolores leves/moderados, '
                      'inflamaciones, traumatismos y síntomas gripales, inhibiendo '
                      'prostaglandinas mediante bloque de CO2.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 114, 109, 109)
                      ),
                    ),
                    const Divider(height: 32, thickness: 1),
                    
                    // Cantidad
                    Row(
                      children: [
                        const Text(
                          'Cantidad',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '10 unds',
                          style: TextStyle(fontSize: 12),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right, 
                          color: Color.fromARGB(255, 0, 87, 255),
                          size: 24
                        ),
                      ],
                    ),
                    const Divider(height: 32, thickness: 1),
                    
                    // Reseña
                    Row(
                      children: [
                        const Text(
                          'Reseña',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 8),
                            Text('5.0', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.keyboard_arrow_right, color: Color.fromARGB(255, 0, 87, 255), size: 24),
                          ],
                        ),
                      ],
                    ),
                  ],
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