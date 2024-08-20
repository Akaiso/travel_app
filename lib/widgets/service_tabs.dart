import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'hover_effect_button.dart';

Widget offeredServicesTabsNavigator(
    VoidCallback onTap, String title, String imageString, Color color) {
  return Builder(
    builder: (context) => Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: MediaQuery.of(context).size.width < 800? BorderRadius.circular(10) : BorderRadius.circular(0),
        ),

          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset(
                        imageString,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}

// Widget tripTypeSelection(String trip, Color color) {
//   return Builder(builder: (context) {
//     return const HoverEffectButton(fontWeight: FontWeight.w200,fontSize: 13, text: ,);
//   });
// }

Widget tripSearchDisplayOption(
    double borderWidth,
    Color borderColor,
    String topRowText,
    Widget iconButton,
    String date,
    String midRowOrText,
    String day) {
  return Builder(
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border:
              Border(right: BorderSide(width: borderWidth, color: borderColor)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      topRowText,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  iconButton
                ],
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    midRowOrText,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              day,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
