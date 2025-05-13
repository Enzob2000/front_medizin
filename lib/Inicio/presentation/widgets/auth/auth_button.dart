import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;

  const AuthButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.width,
    this.height = 67.0,
    this.borderRadius = 19.0,
    this.padding = const EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w800,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        width:
            width ?? double.infinity, // Ancho opcional (full width por defecto)
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: _buttonStyle(),
          child: Text(text, style: _textStyle()),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      padding: MaterialStateProperty.all(padding),
      elevation: MaterialStateProperty.all(0), // Sin sombra
      overlayColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.pressed)) {
          return textColor.withOpacity(0.1);
        }
        return Colors.transparent;
      }),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
      letterSpacing: 0.5,
    );
  }
}
