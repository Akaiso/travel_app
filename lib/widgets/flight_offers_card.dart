import 'package:flutter/material.dart';
import 'hover_effect_button.dart';

class FlightOffersModel extends StatefulWidget {
  const FlightOffersModel({
    super.key,
  });

  @override
  State<FlightOffersModel> createState() => _FlightOffersModelState();
}

class _FlightOffersModelState extends State<FlightOffersModel> {
  Color color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        height: 200,
        width: MediaQuery.of(context).size.width<800? MediaQuery.of(context).size.width * 0.7 : MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: FittedBox(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: MediaQuery.of(context).size.width <800? 350: 600, //MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width <800? 360:550, // * 0.5,
                  child: Image.asset(
                    'assets/images/image1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.width <800? 350: 600, //MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width <800? 360:550,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'One Way',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.0, bottom: 8),
                            child: Text(
                              'Abuja -> Doha',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.0, bottom: 8),
                            child: Text(
                              '₦ 1,300,456',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                          HoverEffectButton(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            text: 'Book Now',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
