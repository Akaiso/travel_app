import 'package:flutter/material.dart';
import 'package:travel_app/utils/font.dart';

class Holidays extends StatefulWidget {
  const Holidays({super.key});

  @override
  State<Holidays> createState() => _HolidaysState();
}

class _HolidaysState extends State<Holidays> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:  Text("Holidays", style: kBoldNormal(),))
    ));
  }
}
