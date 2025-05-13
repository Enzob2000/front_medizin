
import 'package:flutter/material.dart';

class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            return states.contains(MaterialState.selected)
                ? Colors.black
                : Colors.transparent;
          }),
          checkColor: Colors.white,
          side: const BorderSide(color: Colors.black, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
              children: [
                TextSpan(text: 'Al continuar, aceptas nuestros '),
                TextSpan(
                  text: 'términos de servicio ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: 'y '),
                TextSpan(
                  text: 'Política de privacidad',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
