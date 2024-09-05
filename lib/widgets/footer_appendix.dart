import 'package:flutter/material.dart';
import 'package:travel_app/utils/font.dart';

///CHEAP FLIGHTS

class CheapFlightsLayout extends StatefulWidget {
  const CheapFlightsLayout({super.key});

  @override
  State<CheapFlightsLayout> createState() => _CheapFlightsLayoutState();
}

class _CheapFlightsLayoutState extends State<CheapFlightsLayout> {
  List africanFlights = [
    'Flights to Accra',
    'Flights to Nairobi',
    'Flights to Cape Town',
    'Flights to Johannesburg'
  ];
  List europeanFlights = [
    'Flights to London',
    'Flights to Istanbul',
    'Flights to Manchester',
    'Flights to Paris'
  ];
  List asianFlights = [
    'Flights to Dubai',
    'Flights to Abu Dhabi',
    'Flights to Guangzhou',
    'Flights to New Delhi',
  ];
  List northAmericanFlights = [
    'Flights to Atlanta',
    'Flights to Toronto',
    'Flights to Houston',
    'Flights to New York'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'African Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: africanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'European Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: europeanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asian Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: asianFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'North American Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: northAmericanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'African Flights',
                              style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: africanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'European Flights',
                              style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: europeanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asian Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: asianFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'North American Flights',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: northAmericanFlights
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

///BOOK CHEAP HOTELS

class BookCheapHotelsLayout extends StatefulWidget {
  const BookCheapHotelsLayout({super.key});

  @override
  State<BookCheapHotelsLayout> createState() => _BookCheapHotelsLayoutState();
}

class _BookCheapHotelsLayoutState extends State<BookCheapHotelsLayout> {
  List africanHotels = [
    'Hotels in Accra',
    'Hotels in Nairobi',
    'Hotels in Cape Town',
    'Flights to Johannesburg'
  ];
  List europeanHotels = [
    'Hotels in London',
    'Hotels in Istanbul',
    'Hotels in Manchester',
    'Hotels in Paris'
  ];
  List asianHotels = [
    'Hotels in Dubai',
    'Hotels in Abu Dhabi',
    'Hotels in Guangzhou',
    'Hotels in New Delhi'
  ];
  List northAmericanHotels = [
    'Hotels in Atlanta',
    'Hotels in Toronto',
    'Hotels in Houston',
    'Hotels in New York'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'African Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: africanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'European Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: europeanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asian Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: asianHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'North American Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: northAmericanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'African Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: africanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'European Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: europeanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asian Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: asianHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'North American Hotels',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: northAmericanHotels
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

///AIRLINES  LAYOUT 1
class AirlinesLayout1 extends StatefulWidget {
  const AirlinesLayout1({super.key});

  @override
  State<AirlinesLayout1> createState() => _AirlinesLayout1State();
}

class _AirlinesLayout1State extends State<AirlinesLayout1> {
  List localAirlines = ['Air Peace', 'Arik Air', 'Ibom Air', 'Aero Contractor'];
  List domesticAirlines = [
    'Valuejet',
    'United Nigeria Airlines',
    'Green Africa',
    'Azman Air'
  ];
  List airlinesInNigeria = [
    'Dana Air',
    'Asky Airlines',
    "Air Cote D'Ivoire",
    'South African Airways'
  ];
  List airLinesInAfrica = [
    'Egpyptair',
    'Rwandair',
    'Royol Air Maroc',
    'Kenya Air Ways'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Local Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: localAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Domestic Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: domesticAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: airlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Airlines in Africa',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: airLinesInAfrica
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Local Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: localAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Domestic Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: domesticAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: airlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Airlines in Africa',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: airLinesInAfrica
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

///AIRLINES LAYOUT 2
class AirlinesLayout2 extends StatefulWidget {
  const AirlinesLayout2({super.key});

  @override
  State<AirlinesLayout2> createState() => _AirlinesLayout2State();
}

class _AirlinesLayout2State extends State<AirlinesLayout2> {
  List internationalAirlines = [
    'British Airways',
    'Emirates',
    'Qata Airways',
    'Virgin Atlantic',
  ];
  List internationalAirlinesInNigeria = [
    'Lufthansa',
    'KLM',
    'Air France',
    'Turkish Airlines',
  ];
  List foreignAirline = [
    'United Airlines',
    'Delta Airlines',
    'Ethiopian Airlines',
    'Saudi Arabian Airlines',
  ];
  List foreignAirlinesInNigeria = [
    'Hahn Air',
    'MedView',
    'TAAG Angola Airlines',
    'Etihad Airways'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'International Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: internationalAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'International Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: internationalAirlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Foreign Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foreignAirline
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Foreign Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foreignAirlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'International Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: internationalAirlines
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'International Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: internationalAirlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Foreign Airlines',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foreignAirline
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Foreign Airlines in Nigeria',
                            style: kBoldSmall2(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foreignAirlinesInNigeria
                                .map(
                                  (e) => InkWell(
                                    child: MouseRegion(
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
