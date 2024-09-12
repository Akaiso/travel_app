import 'package:flutter/material.dart';

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
        title: const Text("Book your flight"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    ));
  }
}
