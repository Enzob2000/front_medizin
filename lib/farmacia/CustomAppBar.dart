import 'package:flutter/material.dart';
import '../home.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  Size get preferredSize => Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 87, 255),
      elevation: 4,
      toolbarHeight: 90.0,
      leadingWidth: 110,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
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
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Text("Farmacia y Salud",
            style: TextStyle(
              fontSize: 13 ,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,)
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