import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle get displayLarge => GoogleFonts.poppins(fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5); /*headline1*/
  static TextStyle get displayMedium => GoogleFonts.poppins(fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5); /*headline2*/
  static TextStyle get displaySmall => GoogleFonts.poppins(fontSize: 47, fontWeight: FontWeight.w400); /*headline3*/
  static TextStyle get headlineMedium => GoogleFonts.poppins(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25); /*headline4*/
  static TextStyle get headlineSmall => GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400); /*headline5*/
  static TextStyle get titleLarge => GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15); /*headline6*/
  static TextStyle get titleMedium => GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15); /*subtitle1*/
  static TextStyle get titleSmall => GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1); /*subtitle2*/
  static TextStyle get bodyLarge => GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5); /*bodyText1*/
  static TextStyle get bodyMedium => GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25); /*bodyText2*/
  static TextStyle get labelLarge => GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25); /*button*/
  static TextStyle get bodySmall => GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4); /*caption*/
  static TextStyle get labelSmall => GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5); /*overline*/

  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        labelLarge: labelLarge,
        bodySmall: bodySmall,
        labelSmall: labelSmall,
      );
}
