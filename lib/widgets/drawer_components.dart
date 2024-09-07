

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/font.dart';

List drawerContent = [
   Row(
    children: [const Icon(Icons.airplanemode_active, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Flight", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.account_balance, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Stays",style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.drive_eta, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Rides", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.beach_access_outlined, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Holidays", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.phone, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("+2348080000000", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.chat, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("WhatsApp", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.support_agent, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Customer Support", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  ),
   Row(
    children: [const Icon(Icons.mail_outline, color: Color(0xff1e3138),), const SizedBox(width: 10), Text("Contact Us", style: GoogleFonts.openSans(color: kGreenFooter(), fontSize: 13, fontWeight: FontWeight.w700,))],
  )
];


List drawerFunctions = [(){},(){},(){},(){},(){},(){},(){},(){}];