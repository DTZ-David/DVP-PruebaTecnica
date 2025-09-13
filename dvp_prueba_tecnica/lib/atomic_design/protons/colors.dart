import 'package:flutter/material.dart';

class AppColors {
  // ─── Paleta Azul Principal ───

  static const Color primary50 = Color(0xFFEFF6FF);
  static const Color primary100 = Color(0xFFDBEAFE);
  static const Color primary200 = Color(0xFFBFDBFE);
  static const Color primary300 = Color(0xFF93C5FD);
  static const Color primary400 = Color(0xFF60A5FA);
  static const Color primary500 = Color(0xFF3B82F6); // Azul principal
  static const Color primary600 = Color(0xFF2563EB);
  static const Color primary700 = Color(0xFF1D4ED8);
  static const Color primary800 = Color(0xFF1E40AF);
  static const Color primary900 = Color(0xFF1E3A8A);

  // ─── Fuente ───
  static const Color nunitoBoldTime = Color(0xFF4B5563); // gris azulado oscuro

  // ─── Neutrales ───
  static const Color white = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);

  // ─── Semánticos ───
  static const Color success = Color(0xFF22C55E); // verde
  static const Color warning = Color(0xFFF59E0B); // amarillo oscuro
  static const Color error = Color(0xFFEF4444); // rojo
  static const Color info = Color(0xFF3B82F6); // mismo azul que primary500

  // ─── Fondos ───
  static final backgroundPrimary = _mixColors(
    baseColor: white,
    overlayColor: primary400,
    overlayOpacity: 0.1,
  );

  static const Color backgroundSecondary = Color(0xFFF0F4F8); // azul muy claro
  static const Color backgroundAccent = Color(0xFFEFF6FF); // igual a primary50

  static Color _mixColors({
    required Color baseColor,
    required Color overlayColor,
    required double overlayOpacity,
  }) {
    final mixedRed = (baseColor.red * (1 - overlayOpacity) +
            overlayColor.red * overlayOpacity)
        .round();
    final mixedGreen = (baseColor.green * (1 - overlayOpacity) +
            overlayColor.green * overlayOpacity)
        .round();
    final mixedBlue = (baseColor.blue * (1 - overlayOpacity) +
            overlayColor.blue * overlayOpacity)
        .round();

    return Color.fromARGB(255, mixedRed, mixedGreen, mixedBlue);
  }
}
