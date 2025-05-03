import 'package:flutter/material.dart';
import '../home.dart';
import 'package:front_medizin/menudesplegado.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 242, 243, 242),
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 95,
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
            padding: const EdgeInsets.only(top: 0.0, right: 60.0),
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
            'Centro de Ayuda',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 87, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.help_outline_rounded, color: Color.fromARGB(255, 67, 67, 67),size: 25,),
              onPressed: () {},
            ),
          ),
        ],
      );

  }
}
