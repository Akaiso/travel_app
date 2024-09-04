import 'package:flutter/material.dart';

class CardWithDoubleSection extends StatefulWidget {
  final Widget firstSection;
  final Widget secondSection;
  const CardWithDoubleSection(
      {super.key, required this.firstSection, required this.secondSection});

  @override
  State<CardWithDoubleSection> createState() => _CardWithDoubleSectionState();
}

class _CardWithDoubleSectionState extends State<CardWithDoubleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.width < 800 ? 500 : 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                Expanded(child: widget.firstSection),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.4,
                    child: widget.firstSection,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.4,
                    child: widget.secondSection,
                  ),
                ),
              ],
            ),
    );
  }
}
