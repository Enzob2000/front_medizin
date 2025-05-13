import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              icon: Icon(
                Icons.notifications_outlined,
                color: Color.fromARGB(255, 0, 87, 255),
              ),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
              onPressed: () {},
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Image.asset('assets/logo.png', height: 80.0),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Color.fromARGB(255, 0, 87, 255),
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 10.0),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color.fromARGB(255, 0, 87, 255),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}


