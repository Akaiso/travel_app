import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/contact_us.dart';
import 'package:travel_app/view/holidays.dart';
import 'package:travel_app/view/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import '../view/book_flight.dart';
import '../view/book_hotel.dart';
import '../view/book_ride.dart';
import '../view/chart.dart';

List drawerContent = [
  Row(
    children: [
      const Icon(
        Icons.airplanemode_active,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("Flight",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.account_balance,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("Stays",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.drive_eta,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("Rides",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.beach_access_outlined,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("Holidays",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.phone,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("+2348080000000",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.chat,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("WhatsApp",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Row(
    children: [
      const Icon(
        Icons.support_agent,
        color: Color(0xff1e3138),
      ),
      const SizedBox(width: 10),
      Text("Customer Support",
          style: GoogleFonts.openSans(
            color: kGreenFooter(),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ))
    ],
  ),
  Builder(builder: (context) {
    return Row(
      children: [
        const Icon(
          Icons.mail_outline,
          color: Color(0xff1e3138),
        ),
        const SizedBox(width: 10),
        Text("Contact Us",
            style: GoogleFonts.openSans(
              color: kGreenFooter(),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ))
      ],
    );
  })
];


List<Widget> drawerPages = [const BookFlight(), const BookHotel(), const BookRide(), const Holidays(), const ContactUs(), const HomePage(), const Chat(), const ContactUs()];

Future<void> toWhatsApp(BuildContext context) async{
  const String phoneNumber = "+2348086652587";
  const String message= "Hello I need assistance on Trips Guard!";
  final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}'); //('whatsapp://send?phone=$phoneNumber&text=$message') ;

  if(await canLaunchUrl(whatsappUri ) ){
    await launchUrl(whatsappUri);
  }else{
    if(context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Whatsapp not installed")));
    }
  }
}

Future<void> makePhoneCall(BuildContext context) async{
  const String phoneNumber = "+2348086652587";
  final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);

  if(await canLaunchUrl(phoneUrl)){
    await launchUrl(phoneUrl);
  }else{
    if(context.mounted){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Phone app not installed")));
    }
  }
}
