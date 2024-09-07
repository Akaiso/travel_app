import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/utils/colors.dart';

TextStyle kNnormal() {
  return GoogleFonts.openSans(
      fontSize: 13,
      fontWeight: FontWeight
          .w200); //TextStyle(fontSize: 13,fontWeight: FontWeight.w200);
}

TextStyle kBoldNormal() {
  return GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w700);
}

TextStyle kBlueNormal() {
  return GoogleFonts.openSans(
      color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w200);
}

TextStyle kWhiteNormal() {
  return GoogleFonts.openSans(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200);
}

TextStyle kBoldWhiteNormal() {
  return GoogleFonts.openSans(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400);
}

TextStyle kSubtitle() {
  return GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w400);
}

TextStyle kBoldSubtitle2() {
  return GoogleFonts.openSans(fontSize: 25, fontWeight: FontWeight.w700);
}

TextStyle kBoldWhiteSubtitle2() {
  return GoogleFonts.openSans(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white);
}

TextStyle kBoldWhiteSubtitle3() {
  return GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
}

TextStyle kWhiteSubtitle() {
  return GoogleFonts.openSans(
      fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white);
}

TextStyle? kTitle() {
  return GoogleFonts.openSans(fontSize: 35, fontWeight: FontWeight.w600);
}

TextStyle? kSmall() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.normal);
}

TextStyle? kBoldSmall() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600);
}

TextStyle? kBoldSmall2() {
  return GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w700);
}

TextStyle? kWhiteSmall() {
  return GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.normal);
}

// TextStyle? drawerStyleText(){
//   return GoogleFonts.openSans(color: kGreenFooter(), fontSize: 10, fontWeight: FontWeight.w700,);
// }
