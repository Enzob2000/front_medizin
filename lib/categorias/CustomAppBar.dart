import 'package:flutter/material.dart';
import '../home.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 90.0,
      leadingWidth: 110,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 25.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 87, 255)),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homes()), // Make sure Homes is defined
                );
              },
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Text(
          "Categorías",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 87, 255),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: IconButton(
            icon: const Icon(Icons.search_outlined, color: Color.fromARGB(255, 0, 87, 255)),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Color.fromARGB(255, 0, 87, 255)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

