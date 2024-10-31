import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
    List search = GetStorage().read("searchList");

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("AVAILABLE FLIGHT OFFERS"),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Container(
                child: ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "Departure: ${search[index]["itineraries"]["segments"][index]["departure"]["iataCode"]}"),
                          const SizedBox(width: 20),
                          const Text("TO"),
                          const SizedBox(width: 20),
                          Text(
                              "Arrival: ${search[index]["itineraries"]["segments"][index]["arrival"]["iataCode"]}")
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                              "Number of bookable seats: ${search[index]["numberOfBookableSeats"]}"),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                              "Duration: ${search[index]["itineraries"]["duration"]}")
                        ],
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                          "Departure (D/T)): ${search[index]["itineraries"]["segments"][index]["departure"]["at"]}"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                          "Arrival (D/T): ${search[index]["itineraries"]["segments"][index]["arrival"]["at"]}")
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Text("${search[index]["price"]["currency"]}"),
                      const SizedBox(height: 10),
                      Text("${search[index]["price"]["total"]}")
                    ],
                  ),
                  leading: Column(
                    children: [
                      const Text("Airline"),
                      const SizedBox(height: 10),
                      Text(
                          "${search[index]["itineraries"]["segments"][index]["carrierCode"]}")
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
