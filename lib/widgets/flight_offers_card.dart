import 'package:flutter/material.dart';
import 'hover_effect_button.dart';

class FlightOffersModel extends StatefulWidget {
   const FlightOffersModel({required this.imageLink, required this.tripType,
    super.key, required this.fromTo, required this.ticketFare,
  });

  final String imageLink ;
  final String tripType;
  final String fromTo;
  final String ticketFare;

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
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        height: 200,
        width: MediaQuery.of(context).size.width<800? MediaQuery.of(context).size.width * 0.9 : MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(flex:3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: MediaQuery.of(context).size.width <800? 500: 600, //MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width <800? 400:550, // * 0.5,
                  child: Image.asset(widget.imageLink, fit: BoxFit.cover,),

                  // Image.asset(
                  //   'assets/images/010.png',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Expanded(flex:2,
                child: Container(
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.width <800? 500: 600, //MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width <800? 300:550,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tripType,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 3.0, bottom: 8),
                          child: FittedBox(
                            child: Text(
                              widget.fromTo,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const Text(
                          'Pay Now',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                         FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, bottom: 8),
                            child: Text(
                              widget.ticketFare,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const HoverEffectButton(
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
    );
  }
}
