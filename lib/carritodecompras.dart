import 'package:flutter/material.dart';
import 'package:front_medizin/farmacia.dart';
import 'package:flutter/services.dart';

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

class Farmacias {
  final String Nombre;
  final String Distancia;
  final double Precio;
  final String Imagen;

  Farmacias({
    required this.Nombre,
    required this.Distancia,
    required this.Precio,
    required this.Imagen,
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
                    onPressed: () {
                      _abrirModalBottomSheet(context,total);
                    },
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
                     RichText(
  text: TextSpan(
    style: TextStyle(
      fontSize: 14.0,
      color: Color.fromARGB(255, 25, 216, 234),
    ),
    children: [
      WidgetSpan(
        child: SizedBox(
          height: 30, // Altura fija para alinear
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Total:   ',
              style: TextStyle(
                color: Color.fromARGB(255, 25, 216, 234),
              ),
            ),
          ),
        ),
      ),
      WidgetSpan(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            color: Color.fromARGB(255, 45, 59, 142),
            child: Text(
              '${total.toStringAsFixed(2)} Bs',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
)
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


void _abrirModalBottomSheet(BuildContext context, double total) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header con título y botón cerrar
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verificar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 87, 255)
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Color.fromARGB(255, 45, 59, 142),size: 30,),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
          // Lista de opciones
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                // Entrega - Pick Up
                _buildOptionRow(
                  title: 'Entrega',
                  value: 'Pick Up',
                  tipo: 1,
                  onTap: () => _selectDeliveryMethod(context),
                ),
                
                Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
                
                // Método de pago
                _buildOptionRow(
                  title: 'Método de pago',
                  value: 'Pago movil',
                  tipo: 1,
                  onTap: () => _selectMetodoPago(context,total),
                ),
                
                Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
                
                _buildOptionRow(
                  title: 'Código de descuento',
                  value: 'Aplicar',
                  tipo: 1,
                  onTap: () {}),
                
                
                Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
                
                _buildOptionRow(
                  title: 'Costo Total',
                  value: '${total.toStringAsFixed(2)} Bs',
                  tipo: 2,
                  onTap: () {}),

                Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
              ],
            ),
          ),
          
          // Términos y condiciones + Botón
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(color: Color.fromARGB(255, 0, 87, 255), fontSize: 14),
                    children: [
                      TextSpan(text: 'Al realizar un pedido, '),
                      TextSpan(
                        text: 'usted acepta',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' nuestros\n'),
                      TextSpan(
                        text: 'Términos y condiciones',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () => _processPayment(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Pagar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 20),
              ],
              
            ),
            
          ),
          
        ],
      ),
    ),
  );
}

Widget _buildOptionRow({
  required String title,
  required String value,
  required VoidCallback onTap,
  required int tipo,
}) {
  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.centerLeft,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 87, 255),
            fontWeight: FontWeight.w600,
          ),
        ),
        (tipo == 1) 
              ? Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 45, 59, 142),
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.chevron_right, color: Color.fromARGB(255, 45, 59, 142),size: 25,),
          ],
        )
              : Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 45, 59, 142),
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.chevron_right, color: Color.fromARGB(255, 45, 59, 142),size: 25,),
          ],
        )
        
      ],
    ),
  );
}

// Funciones de ejemplo para las acciones
void _selectDeliveryMethod(BuildContext context) {
  // Variable para rastrear el método de entrega seleccionado
  bool isDeliverySelected = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ... (Título y otros widgets anteriores)
               Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: 
                Text(
                  'Tipo de Entrega',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 87, 255)
                  ),
                ),
            ),
          ),
          SizedBox(height: 5,),
              // Botón Pick Up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDeliverySelected = false; // Cambia a Pick Up
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => isDeliverySelected 
                          ? const Color.fromARGB(255, 227, 227, 227) 
                          : const Color.fromARGB(255, 25, 216, 234),
                      ),
                      // ... (otros estilos)
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Pick Up',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isDeliverySelected 
                          ? const Color.fromARGB(255, 114, 109, 109) 
                          : const Color.fromARGB(255, 76, 76, 76),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),

              // Botón Delivery
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDeliverySelected = true; // Cambia a Delivery
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => isDeliverySelected 
                          ? const Color.fromARGB(255, 25, 216, 234) 
                          : const Color.fromARGB(255, 227, 227, 227),
                      ),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                     ),
                      // ... (otros estilos)
                    ),
                    child: Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isDeliverySelected 
                          ? const Color.fromARGB(255, 76, 76, 76) 
                          : const Color.fromARGB(255, 114, 109, 109),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 150),

              // Botón inferior dinámico (Aceptar/Siguiente)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () => _processPayment(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      isDeliverySelected ? 'Siguiente' : 'Aceptar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        );
      },
    ),
  );
}




void _selectMetodoPago(BuildContext context,double total) {
  // Variable para rastrear el método de entrega seleccionado
  int isDeliverySelected = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ... (Título y otros widgets anteriores)
               Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: 
                Text(
                  'Tipo de Pago',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 87, 255)
                  ),
                ),
            ),
          ),
          SizedBox(height: 5,),
              // Botón Pick Up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDeliverySelected = 1; // Cambia a Pick Up
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => isDeliverySelected ==1
                          ? const Color.fromARGB(255, 25, 216, 234) 
                          : const Color.fromARGB(255, 227, 227, 227),
                      ),
                      // ... (otros estilos)
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Transferencia Bancaria',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isDeliverySelected ==1
                          ? const Color.fromARGB(255, 114, 109, 109) 
                          : const Color.fromARGB(255, 76, 76, 76),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),

              // Botón Delivery
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDeliverySelected = 2; // Cambia a Delivery
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => isDeliverySelected ==2
                          ? const Color.fromARGB(255, 25, 216, 234) 
                          : const Color.fromARGB(255, 227, 227, 227),
                      ),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                     ),
                      // ... (otros estilos)
                    ),
                    child: Text(
                      'Pago Móvil',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isDeliverySelected ==2
                          ? const Color.fromARGB(255, 76, 76, 76) 
                          : const Color.fromARGB(255, 114, 109, 109),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),

              // Botón Delivery
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDeliverySelected = 3; // Cambia a Delivery
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => isDeliverySelected ==3
                          ? const Color.fromARGB(255, 25, 216, 234) 
                          : const Color.fromARGB(255, 227, 227, 227),
                      ),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                     ),
                      // ... (otros estilos)
                    ),
                    child: Text(
                      'Ubii Pago',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isDeliverySelected ==3
                          ? const Color.fromARGB(255, 76, 76, 76) 
                          : const Color.fromARGB(255, 114, 109, 109),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120),

              // Botón inferior dinámico (Aceptar/Siguiente)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () => _datosdePago(context,total),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Siguiente' ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        );
      },
    ),
  );
}

void _datosdePago(BuildContext context, double total) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,  // Esto es importante
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,  // Ajusta según el teclado
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(  // Permite desplazamiento cuando el teclado aparece
          child: Column(  
            
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Datos de Pago Móvil',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 87, 255),
                    ),
                  ),
                ),
              ),
              _buildTextField('Banco Receptor:', '0102 - Banco de venezuela', 1, context),
              SizedBox(height: 15),
              _buildTextField('Número de Teléfono:', '0424-8690000', 2, context),
              SizedBox(height: 15),
              _buildTextField('Cédula o Rif:', 'J-406112340', 2, context),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Monto Total:', 
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 87, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('${total.toStringAsFixed(2)} Bs',
                      style: TextStyle(
                        color: Color.fromARGB(255, 45, 59, 142),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
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
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                    ),
                    child: Text(
                      'Verificar pago',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),  // Espacio adicional de seguridad
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildTextField(String label, String value,int num, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
        
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 139, 139, 139),
            fontWeight: FontWeight.w600,
          ),
        ),
        ),
        const SizedBox(height: 4),
        Padding(padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: 
        TextFormField(
          initialValue: value,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 139, 139, 139),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 227, 227, 227),
            filled: true,
            
            hintStyle: TextStyle(color: Color.fromARGB(255, 114, 109, 109)),
            suffixIcon: num==2
            ?Row(
      mainAxisSize: MainAxisSize.min, // Para que el Row ocupe solo el espacio necesario
      children: [
        Text(
          'Copiar',
          style: TextStyle(
            color: Color.fromARGB(255, 139, 139, 139),
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        ),
        IconButton(
          icon: Image.asset(
            'assets/copiar.png',
            color: Color.fromARGB(255, 139, 139, 139),
            width: 20, height: 20,
          ),
          onPressed: () async {
                if (value.isNotEmpty) {
                  await Clipboard.setData(ClipboardData(text: value));
                  // Opcional: Mostrar mensaje de confirmación
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Texto copiado al portapapeles'),
                      duration: Duration(seconds: 1),
                    )
                  );
                }
              },
        ),
      ],
    ):null,
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
        ),
      ],
    );
  }


void _processPayment(BuildContext context) {
  
  int? selectedFarmaciaIndex;

  List<Farmacias> farmacias = [
    Farmacias(
      Nombre: 'Farmacia Cuida de tu salud',
      Distancia: '0.5km',
      Precio: 272.93,
      Imagen: 'assets/farmacia1.jpg',
    ),
    Farmacias(
      Nombre: 'Farmacia Cuida de tu salud',
      Distancia: '0.9km',
      Precio: 260.51,
      Imagen: 'assets/farmacia2.jpg',
    ),
    Farmacias(
      Nombre: 'Farmacia Cuida de tu salud',
      Distancia: '1.2km',
      Precio: 286.10,
      Imagen: 'assets/farmacia3.png',
    ),
    Farmacias(
      Nombre: 'Farmacia Cuida de tu salud',
      Distancia: '1.5km',
      Precio: 311.69,
      Imagen: 'assets/farmacia4.jpg',
    ),
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Importante para evitar el error
            children: [
              // Título
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Elige tu farmacia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 87, 255),
                    ),
                  ),
                ),
              ),

              // Lista de farmacias (sin Expanded)
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6, // Altura máxima
                ),
                child: ListView.builder(
                  shrinkWrap: true, // Para que se ajuste al contenido
                  physics: ClampingScrollPhysics(), // Evita scroll infinito
                  itemCount: farmacias.length,
                  itemBuilder: (context, index) {
                    final farmacia = farmacias[index];
                    final isSelected = index == selectedFarmaciaIndex;
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
                    padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 105,
                          height: 115,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(farmacia.Imagen),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 25),
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
                                        children: [SizedBox(height: 10),
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
                                              
                                            ],
                                          ),
                                          SizedBox(height: 0),
                                          Text(
                                            farmacia.Nombre,
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
                                    SizedBox(width: 15),
                                    Container(
                                      height: 65,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: InkWell(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                //productos.removeAt(index);
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0),
                                              child: Icon(
                                                Icons.favorite_border_outlined,
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
                                child: 
                                    Text(
                                      'Distancia: ${farmacia.Distancia}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Color.fromARGB(255, 114, 109, 109),
                                      ),
                                    ),
                              ),
                              SizedBox(height: 0),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: 
                                    Text(
                                      'Bs. ${farmacia.Precio}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 87, 255),
                                      ),
                                    ),
                              ),
                              SizedBox(height: 0),
                              Padding(
                padding: EdgeInsets.symmetric( vertical: 3),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {setState(() {
                            selectedFarmaciaIndex = isSelected ? null : index;
                          });},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                              ? Color.fromARGB(255, 227, 227, 227) // Color gris si está seleccionado
                              : Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    child: 
                        Text(
                          isSelected ? "Elegido" : "Elegir",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isSelected 
                            ? Color.fromARGB(255, 114, 109, 109) 
                            : Colors.white,
                          ),
                        ),
                        
                  ),
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

              // Botón de pago
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 19),
                    ),
                    child: 
                        Text(
                          'Aceptar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    ),
  );
}