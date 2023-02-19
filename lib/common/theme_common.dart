import 'package:flutter/material.dart';

//const kPrimaryColor = Color(0x004f589a);
const kPrimaryColor = Color(0x1E96CA);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0x1E96CA).withOpacity(0.9),
  colorScheme:  ColorScheme.light(
    primary: const Color(0x1E96CA).withOpacity(0.9),
    secondary:const Color(0x1E96CA).withOpacity(0.9),
  ),
);

