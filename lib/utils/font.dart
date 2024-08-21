import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle normal() {
  return GoogleFonts.openSans(
      fontSize: 13,
      fontWeight: FontWeight
          .w200); //TextStyle(fontSize: 13,fontWeight: FontWeight.w200);
}

TextStyle boldNormal() {
  return GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w700);
}

TextStyle blueNormal() {
  return GoogleFonts.openSans(
      color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w200);
}

TextStyle whiteNormal() {
  return GoogleFonts.openSans(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200);
}

TextStyle boldWhiteNormal() {
  return GoogleFonts.openSans(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400);
}

TextStyle subtitle() {
  return GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w400);
}

TextStyle boldSubtitle2() {
  return GoogleFonts.openSans(fontSize: 25, fontWeight: FontWeight.w700);
}

TextStyle whiteSubtitle() {
  return GoogleFonts.openSans(
      fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white);
}

TextStyle? title() {
  return GoogleFonts.openSans(fontSize: 35, fontWeight: FontWeight.w600);
}

TextStyle? small() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.normal);
}

TextStyle? boldSmall() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600);
}

TextStyle? boldSmall2() {
  return GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w700);
}

TextStyle? whiteSmall() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.normal);
}
