import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/contact_us.dart';
import 'package:travel_app/view/holidays.dart';
import 'package:travel_app/view/home_page.dart';

import '../utils/colors.dart';
import '../view/book_flight.dart';
import '../view/book_hotel.dart';
import '../view/book_ride.dart';
import '../view/chat.dart';
import '../view/currency_converter.dart';

List drawerContent = [
  drawerTile(Icons.airplanemode_active, "flight"),
  drawerTile(Icons.account_balance, "Stays"),
  drawerTile(Icons.drive_eta, "Rides"),
  drawerTile(Icons.beach_access_outlined, "Holidays"),
  drawerTile(Icons.phone, "+2348086652587"),
  drawerTile(Icons.chat, "WhatsApp"),
  drawerTile(Icons.support_agent, "Customer Support"),
  drawerTile(Icons.mail_outline, "Contact Us"),
  drawerTile(Icons.currency_exchange, "Currency Converter"),
];

List<Widget> drawerPages = [
  const BookFlight(),
  const BookHotel(),
  const BookRide(),
  const Holidays(),
  const ContactUs(),
  const HomePage(),
  const Chat(),
  const ContactUs(),
  const CurrencyConverterScreen()
];

Widget drawerTile(
  IconData icon,
  String title,
) {
  return Row(
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: const Color(0xff1e3138),
          ),
          const SizedBox(width: 10),
          Text(title,
              style: GoogleFonts.openSans(
                color: kGreenFooter(),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ))
        ],
      ),
    ],
  );
}
