import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Style {
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.shade400,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 2.0),
            blurRadius: 1.0,
          ),
        ],
      );

  static BoxDecoration get buttonDecoration => BoxDecoration(
        color: Style.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      );

  static Color get iceBackground => const Color(0XFFF7F8FC);

  static TextStyle get bold => const TextStyle(fontWeight: FontWeight.bold);

  static TextStyle get white => const TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.white,
      );

  static InputDecoration inputDecoration({String? hint}) {
    return InputDecoration(
      errorText: null,
      hintText: hint,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Style.primaryColor,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Style.secondaryColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }

  static Color get primaryColor => Colors.indigo;
  static Color get secondaryColor => Colors.lightGreen;

  static Color get atrasada => Colors.redAccent[400]!;
  static Color get emEspera => const Color(0XFFd9d9d9);
  static Color get cancelada => const Color(0XFFefefef);
  static Color get completa => Colors.greenAccent;
  static Color get emProgresso => Colors.yellow[600]!;
}
