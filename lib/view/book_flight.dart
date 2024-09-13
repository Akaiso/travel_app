import 'package:flutter/material.dart';

import '../utils/font.dart';

class BookFlight extends StatefulWidget {
  const BookFlight({super.key});

  @override
  State<BookFlight> createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:  Text("Book your flight", style: kBoldNormal()),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    ));
  }
}
