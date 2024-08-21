import 'package:flutter/material.dart';

class SuggestionInfo extends StatefulWidget {
  final String iconString;
  final String titleString;
  final String subtitleString;
  const SuggestionInfo(
      {super.key,
      required this.iconString,
      required this.titleString,
      required this.subtitleString});

  @override
  State<SuggestionInfo> createState() => _SuggestionInfoState();
}

class _SuggestionInfoState extends State<SuggestionInfo> {
  Color textHoverColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            textHoverColor = Colors.blue;
          });
        },
        onExit: (_) {
          setState(() {
            textHoverColor = Colors.black;
          });
        },
        child: ListTile(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: (Image.asset(widget.iconString)),
          ),
          title: Text(
            widget.titleString,
            style: TextStyle(
                color: textHoverColor,
                fontSize: 14,
                fontWeight: FontWeight.w900),
          ),
          isThreeLine: true,
          subtitle: FittedBox(
              child: Text(
                  style: TextStyle(
                    color: textHoverColor,
                  ),
                  widget.subtitleString)),
        ),
      ),
    );
  }
}
