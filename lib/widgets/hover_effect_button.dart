import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:travel_app/utils/colors.dart';

class HoverEffectButton extends StatefulWidget {
  const HoverEffectButton(
      {super.key,
      this.onTap,
      required this.fontWeight,
      required this.fontSize,
      required this.text});
  final dynamic onTap;
  final FontWeight fontWeight;
  final double fontSize;
  final String text;

  @override
  State<HoverEffectButton> createState() => _HoverEffectButtonState();
}

class _HoverEffectButtonState extends State<HoverEffectButton> {
  Color? color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = kOrange();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onHover: (_) {
          setState(() {
            color = kBlue();
          });
        },
        onExit: (_) {
          setState(() {
            color = kOrange();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
