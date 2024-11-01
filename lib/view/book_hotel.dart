import 'package:flutter/material.dart';

import '../utils/font.dart';

class BookHotel extends StatefulWidget {
  const BookHotel({super.key});

  @override
  State<BookHotel> createState() => _BookHotelState();
}

class _BookHotelState extends State<BookHotel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title:  Text("Stays",style: kBoldNormal())),
    ));
  }
}
