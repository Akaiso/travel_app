import 'package:flutter/material.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/font.dart';
import 'package:travel_app/widgets/dropdown_button.dart';

import 'footer_components.dart';

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
      height: MediaQuery.of(context).size.width < 800 ? 850 : 600,
      color: kGreenFooter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50.0),
        child: MediaQuery.of(context).size.width < 800
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fitWidth,
                      )),
                  const SizedBox(height: 10),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            // width: 300,
                            height: 40,
                            child: Image.asset("assets/images/playstore.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            // width: 300,
                            height: 40,
                            child: Image.asset("assets/images/appstore.png")),
                      ]),
                  const SizedBox(
                    height: 20,
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
                      socialMedia("assets/images/instagram.png", (){}),
                      socialMedia("assets/images/whatsapp.png", (){}),
                      socialMedia("assets/images/linkedin.png", (){}),
                      socialMedia("assets/images/facebook.png", (){}),
                      socialMedia("assets/images/youtube.png", (){}),
                      socialMedia("assets/images/twitter.png", (){}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      listAndLinks(header: "Company",link1: "About Us", link2:"Trips Guard Affiliates", link3:"Refer A customer", link4: "Blog", link5: "Contact Us" ),
                      listAndLinks(header: "Useful Links", link1: "Privacy Policies", link2: "Terms And Conditions", link3: '', link4: '', link5: ''),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      "Currency",
                      style: kBoldWhiteSubtitle3(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: const LanguageDropdown()),
                  const SizedBox(height: 30),
                  Divider(
                    thickness: 0.5,
                    color: kScaffoldBg(),
                  )
                ],
              )
            : Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SizedBox(
                            height: 450,
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
                                    child: Image.asset(
                                        "assets/images/playstore.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    // width: 300,
                                    height: 40,
                                    child: Image.asset(
                                        "assets/images/appstore.png")),
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
                                    socialMedia("assets/images/instagram.png", (){}),
                                    socialMedia("assets/images/whatsapp.png", (){}),
                                    socialMedia("assets/images/linkedin.png", (){}),
                                    socialMedia("assets/images/facebook.png", (){}),
                                   socialMedia("assets/images/youtube.png", (){}),
                                    socialMedia("assets/images/twitter.png", (){}),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      listAndLinks(header: "Company",link1: "About Us", link2:"Trips Guard Affiliates", link3:"Refer A customer", link4: "Blog", link5: "Contact Us" ),
                      listAndLinks(header: "Useful Links", link1: "Privacy Policies", link2: "Terms And Conditions", link3: '', link4: '', link5: ''),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            height: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "Currency",
                                    style: kBoldWhiteSubtitle3(),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                    ),
                                    child: const LanguageDropdown())
                              ],
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: kScaffoldBg(),
                  )
                ],
              ),
      ),
    );
  }
}
