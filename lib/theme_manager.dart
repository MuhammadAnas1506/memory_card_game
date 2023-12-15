import 'package:flutter/material.dart';

List<Color> gradientLight = [
  const Color(0xFFFFF8E1),
  const Color(0xFFFFBB7C),
  const Color(0xFFFFECB3),
];

List<Color> gradientLightBody = [
  const Color(0xFFFFBB7C),
  const Color(0xFFFFF8E1),
];

List<Color> gradientLightBottomBar = [
  const Color(0xFFFFF8E1),
  const Color(0xFFFFD54F),
  const Color(0xFFFFCA28),
];

List<Color> gradientDark = [
  const Color(0xFF747DA1),
  const Color(0xFF505875),
  const Color(0xFF9FA9D6),
];

List<Color> gradientDarkBody = [
  const Color(0xFF5F6791),
  const Color(0xFF9FA9D6),
];

List<Color> gradientDarkBottomBar = [
  const Color(0xFF9FA9D6),
  const Color(0xFF5F6791),
  const Color(0xFF505875),
];

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xFFE96F00),
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primaryContainer: Color(0xFFFFF8E1),
    onPrimaryContainer: Colors.black,
    shadow: Color(0x33FFC107),
    outline: Color(0x99FFC107),
    secondaryContainer: Color(0x99FFC107),
    tertiaryContainer: Color(0x66FFC107),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(),
  iconTheme: const IconThemeData(
    color: Color(0xFFE96F00),
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primaryContainer: Color(0xFF9FA9D6),
    onPrimaryContainer: Colors.white,
    shadow: Color(0x33505875),
    outline: Color(0x999FA9D6),
    secondaryContainer: Color(0x999FA9D6),
    tertiaryContainer: Color(0xFF9FA9D6),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);

