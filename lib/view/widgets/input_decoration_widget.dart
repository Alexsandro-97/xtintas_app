import 'package:flutter/material.dart';

abstract class InputDecorationCustom extends InputDecoration {
  static InputDecoration customDecoration({String? placeHolder}) {
    return InputDecoration(
      errorStyle: const TextStyle(fontWeight: FontWeight.bold),
      hintText: placeHolder,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
      filled: true,
      fillColor: Colors.white.withOpacity(0.4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide.none,
      ),
    );
  }
}
