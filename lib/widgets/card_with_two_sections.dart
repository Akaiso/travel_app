

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWithDoubleSection extends StatefulWidget {
  final Widget firstSection;
  final Widget secondSection;
  const CardWithDoubleSection({super.key, required this.firstSection, required this.secondSection});

  @override
  State<CardWithDoubleSection> createState() => _CardWithDoubleSectionState();
}

class _CardWithDoubleSectionState extends State<CardWithDoubleSection> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.4,
          child: widget.firstSection,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.4,
          child: widget.secondSection,),

        ],
      ),
    );
  }
}
