import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/font.dart';
import 'package:travel_app/widgets/dropdown_button.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      color: kGreenFooter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.fitWidth,
                        )),
                    SizedBox(
                        // width: 300,
                        height: 40,
                        child: Image.asset("assets/images/playstore.png")),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        // width: 300,
                        height: 40,
                        child: Image.asset("assets/images/appstore.png")),
                    const SizedBox(
                      height: 30,
                    ),
                    FittedBox(
                      child: Text(
                        "Connect With Us",
                        style: kBoldWhiteSubtitle3(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 15,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/instagram.png")),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/whatsapp.png")),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/linkedin.png")),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/facebook.png")),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Image.asset("assets/images/youtube.png")),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/twitter.png")),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company',
                      style: kBoldWhiteSubtitle3(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("About Us", style: kWhiteNormal()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Trips Guard Affiliates", style: kWhiteNormal()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Refer A customer", style: kWhiteNormal()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Blog", style: kWhiteNormal()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Contact Us", style: kWhiteNormal()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Useful Links',
                      style: kBoldWhiteSubtitle3(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Privacy Policies", style: kWhiteNormal()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Terms And Conditions", style: kWhiteNormal()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Currency",
                        style: kBoldWhiteSubtitle3(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          height: 35,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: const LanguageDropdown())
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
