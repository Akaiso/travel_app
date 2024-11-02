import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:travel_app/utils/colors.dart';

import '../utils/font.dart';

class FlightOfferSearch {
  DateTime? departure;
  int? numberOfBookableSeats;
  double? price;
  String? currency;
  String? airline;

  FlightOfferSearch({
    this.departure,
    this.numberOfBookableSeats,
    this.price,
    this.currency,
    this.airline,
  });

  factory FlightOfferSearch.fromJson(Map<String, dynamic> json) {
    return FlightOfferSearch(
        departure: json["data"]["departure"],
        numberOfBookableSeats: json["data"]["number"],
        price: json["data"]["price"],
        currency: json["data"]["currency"],
        airline: json["data"]["airline"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'departure': departure,
      'numberOfBookableSeats': numberOfBookableSeats,
      'price': price,
      'currency': currency,
      'airline': airline,
    };
  }
}

///CLASS THAT DISPLAYS THE LIST OF FLIGHT OFFERS

class FlightOfferSearchDisplay extends StatefulWidget {
  const FlightOfferSearchDisplay({super.key});

  @override
  State<FlightOfferSearchDisplay> createState() =>
      _FlightOfferSearchDisplayState();
}

class _FlightOfferSearchDisplayState extends State<FlightOfferSearchDisplay> {


  @override
  Widget build(BuildContext context) {
    List search = GetStorage().read("searchListResponseFromDioClientClass");

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          GetStorage().remove("searchListResponseFromDioClientClass");
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back),),
        centerTitle: true,
        title: Text("AVAILABLE FLIGHT OFFERS", style: kBoldNormal()),
      ),
      body: SingleChildScrollView(
        child: //Text("FLIGHT OFFER SEARCH"),
            ListView.builder(
          itemCount: search.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            //List result = fromDio.map((e) =>  e).toList();
            //  return const Text("FLIGHT OFFER SEARCH");
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: ListTile(
                onTap: () {},
                tileColor: Colors.white,
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            " ${search[index]["itineraries"][0]["segments"][0]["departure"]["iataCode"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)), //Departure
                        const SizedBox(width: 20),
                        const Text("TO"),
                        const SizedBox(width: 20),
                        Text(
                            " ${search[index]["itineraries"][0]["segments"][0]["arrival"]["iataCode"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)) //Arrival
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                            "Seats:  ${search[index]["numberOfBookableSeats"]}"),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                            "Duration:  ${search[index]["itineraries"][0]["duration"]}")
                      ],
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                        "Departure (D/T)): ${search[index]["itineraries"][0]["segments"][0]["departure"]["at"]}"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        "Arrival (D/T): ${search[index]["itineraries"][0]["segments"][0]["arrival"]["at"]}")
                  ],
                ),
                trailing: Column(
                  children: [
                    Text("${search[index]["price"]["currency"]}"),
                    const SizedBox(height: 5),
                    Text(
                      "${search[index]["price"]["total"]}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                leading: Column(
                  children: [
                    const Text("Airline"),
                    const SizedBox(height: 10),
                    Text(
                      "${search[index]["itineraries"][0]["segments"][0]["carrierCode"]}",
                      style: TextStyle(
                          color: kOrange(), fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
