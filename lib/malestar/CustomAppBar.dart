import 'package:flutter/material.dart';
import '../home.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 87, 255),
      elevation: 0,
      toolbarHeight: 90.0,
      leadingWidth: 90,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 25.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homes()),
                );
              },
            ),
          ],
        ),
      ),
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text(
            "Malestar General",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 1,
            textAlign: TextAlign.right,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: IconButton(
            icon: const Icon(Icons.search_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
