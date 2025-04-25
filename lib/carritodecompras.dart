import 'package:flutter/material.dart';

void main() {
  runApp(Carrito());
}

class Carrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmacia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: CarritoComprasScreen(),
    );
  }
}

class Producto {
  final String categoria;
  final String nombre;
  final double precio;
  final double precio2;
  int cantidad;
  final String imagen;

  Producto({
    required this.categoria,
    required this.nombre,
    required this.precio,
    required this.precio2,
    this.cantidad = 1,
    required this.imagen,
  });
}

class CarritoComprasScreen extends StatefulWidget {
  @override
  _CarritoComprasScreenState createState() => _CarritoComprasScreenState();
}

class _CarritoComprasScreenState extends State<CarritoComprasScreen> {
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

  List<Producto> productos = [
    Producto(
      categoria: 'Farmacia y salud',
      nombre: 'Acetaminofén 650Mg X 10 Tabletas',
      precio: 35.99,
      precio2: 50.51,
      imagen: 'assets/acetaminofen_650mg.png'
    ),
    Producto(
      categoria: 'Farmacia y salud',
      nombre: 'Acetaminofén 500mg 10 tabletas Genven',
      precio: 45.99,
      precio2: 60.99,
      imagen: 'assets/acetaminofen_500mg.png'
    ),
    Producto(
      categoria: 'Farmacia y salud',
      nombre: 'Torsilax x 10 Comprimidos',
      precio: 69.99,
      precio2: 99.99,
      imagen: 'assets/torsilax.png'
    ),
    Producto(
      categoria: 'Farmacia y salud',
      nombre: 'Atamel Acetaminofén 500 Mg X 20 Tabletas',
      precio: 120.99,
      precio2: 150.99,
      imagen: 'assets/atamel.png'
    ),
  ];

  double get total {
    return productos.fold(0, (sum, item) => sum + (item.precio * item.cantidad));
  }

  void _actualizarTotal() {
    setState(() {}); // Fuerza la reconstrucción del widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  elevation: 0,
  toolbarHeight: 85.0,
  leadingWidth: 90,
  title: Container(
    alignment: Alignment.center, // Centra el contenido
    child: Row(
      mainAxisSize: MainAxisSize.min, // Hace que el Row ocupe solo el espacio necesario
      children: [ 
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 87, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
        ),
        SizedBox(width: 10), // Espacio entre icono y texto
        Text(
          'Mi carrito',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 87, 255),
            fontSize: 22,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    ),
  ),
  centerTitle: true,
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(1.5), // Altura del borde
    child: Container(
      color: Colors.grey[300], // Color del borde
      height: 1.0, // Grosor del borde
    ),
  ), // Esto es crucial para centrar el título
),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromARGB(255, 139, 139, 139),
                      width: 1,
                    )
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(producto.imagen),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            producto.categoria,
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 87, 255),
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 0),
                                          Text(
                                            producto.nombre,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Color.fromARGB(255, 67, 67, 67),
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 65,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: InkWell(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                productos.removeAt(index);
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0),
                                              child: Icon(
                                                Icons.close,
                                                color: Color.fromARGB(255, 0, 87, 255),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Bs. ${producto.precio.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 87, 255),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Bs. ${producto.precio2.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 139, 139, 139),
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0),
                              Container(
                                child: QuantitySelector(
                                  initialValue: producto.cantidad,
                                  minValue: 1,
                                  maxValue: 100,
                                  producto: producto,
                                  onChanged: (value) {
                                    _actualizarTotal();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
            
            child: Column(
              children: [
               
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                    ),padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 37)
                    ),
                    child: Row(children: [ Text(
                      'Pagar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),Spacer(),
                    Text(
                      '${total.toStringAsFixed(2)} Bs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ],),
                  ),
                ),
              ],
            ),
          ),
      
        ],
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

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final Producto producto;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
    required this.producto,
    this.minValue = 1,
    this.maxValue = 10,
    required this.onChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Botón - (izquierda)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                onTap: () {
                  setState(() {
                    if (widget.producto.cantidad > widget.minValue) {
                      widget.producto.cantidad--;
                      widget.onChanged(widget.producto.cantidad);
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: widget.producto.cantidad <= widget.minValue 
                        ? Color.fromARGB(255, 114, 109, 109)
                        : Color.fromARGB(255, 0, 87, 255),
                  ),
                ),
              ),
            ),
            
            // Cantidad (centro)
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '${widget.producto.cantidad}',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w600, 
                  color: Color.fromARGB(255, 67, 67, 67)
                ),
              ),
            ),

            // Botón + (derecha)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                onTap: () {
                  setState(() {
                    if (widget.producto.cantidad < widget.maxValue) {
                      widget.producto.cantidad++;
                      widget.onChanged(widget.producto.cantidad);
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: widget.producto.cantidad >= widget.maxValue 
                        ? Color.fromARGB(255, 114, 109, 109)
                        : Color.fromARGB(255, 0, 87, 255),
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