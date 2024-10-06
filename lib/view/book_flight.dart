import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/model/provider.dart';

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
        title:  Text("Flight", style: kBoldNormal()),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("${context.watch<ChatListProvider>().chat}")),
            Text("${context.watch<CounterProvider>().counter}")
          ],
        ),
      ),
    ));
  }
}
