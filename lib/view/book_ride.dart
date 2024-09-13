import 'package:flutter/material.dart';

import '../utils/font.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:  Text("Book a ride", style: kBoldNormal()),),
    ));
  }
}