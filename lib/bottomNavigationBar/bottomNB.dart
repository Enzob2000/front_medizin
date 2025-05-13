import 'package:flutter/material.dart';

class BNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  
  const BNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Color _getColor(int index) {
    return currentIndex == index 
        ? const Color.fromARGB(255, 0, 87, 255) 
        : const Color.fromARGB(255, 67, 67, 67);
  }

  List<BottomNavigationBarItem> _buildMenuItems() {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/inicio.png',
          width: 24,
          height: 24,
          color: _getColor(0),
        ),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/categoria.png', 
          width: 24, 
          height: 24,
          color: _getColor(1),
        ),
        label: 'Categoría',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/favoritos.png', 
          width: 24, 
          height: 24,
          color: _getColor(2),
        ),
        label: 'Favoritos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/creditos.png', 
          width: 24, 
          height: 24,
          color: _getColor(3),
        ),
        label: 'Creditos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/servicios.png', 
          width: 24, 
          height: 24,
          color: _getColor(4),
        ),
        label: 'Servicios',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10.0,
            offset: const Offset(0, -2),
          ),
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
          items: _buildMenuItems(),
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 87, 255),
          unselectedItemColor: const Color.fromARGB(255, 67, 67, 67),
          backgroundColor: Colors.white,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}