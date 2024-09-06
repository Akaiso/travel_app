
import 'package:flutter/material.dart';

import '../utils/font.dart';

Widget socialMedia(String imageString, onTap){

  return  InkWell(onTap: onTap,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(30),
          border: Border.all(
              width: 1, color: Colors.white)),
      child: Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
                "assets/images/linkedin.png")),
      ),
    ),
  );
}

Widget listAndLinks({required String header,String? link1, String? link2, String? link3, String? link4, String? link5}){
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                header,
                style: kBoldWhiteSubtitle3(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(link1!, style: kWhiteNormal()),
            const SizedBox(
              height: 10,
            ),
            Text(link2!,
                style: kWhiteNormal()),
            const SizedBox(
              height: 10,
            ),
            Text(link3!, style: kWhiteNormal()),
            const SizedBox(
              height: 10,
            ),
            Text(link4!, style: kWhiteNormal()),
            const SizedBox(
              height: 10,
            ),
            Text(link5!, style: kWhiteNormal()),
          ],
        ),
      ),
    ),
  );
}