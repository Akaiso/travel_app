import 'package:flutter/material.dart';

import '../utils/font.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:  Text("Chat", style: kBoldNormal()),
      ),
    ));
  }
}
