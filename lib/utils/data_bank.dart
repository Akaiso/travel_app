import 'package:flutter/cupertino.dart';

List citiesAndAirports = [
  "Hartsfield-Jackson Atlanta International, ATL, Atlanta, USA",
  "Los Angeles International, LAX, Los Angeles, USA",
  "Dubai International, DXB, Dubai, UAE",
  "London Heathrow, LHR, London, UK",
  "Tokyo Haneda, HND, Tokyo, Japan",
  "Charles de Gaulle, CDG, Paris, France",
  "Frankfurt International, FRA, Frankfurt, Germany",
  "Changi International, SIN, Singapore",
  "Amsterdam Schiphol, AMS, Amsterdam, Netherlands",
  "Dallas/Fort Worth International, DFW, Dallas, USA",
  "Beijing Capital International, PEK, Beijing, China",
  "Madrid Barajas, MAD, Madrid, Spain",
  "Miami International, MIA, Miami, USA",
  "Toronto Pearson International, YYZ, Toronto, Canada",
  "Sydney Kingsford Smith, SYD, Sydney, Australia",
  "Soekarno-Hatta International, CGK, Jakarta, Indonesia",
  "São Paulo-Guarulhos International, GRU, São Paulo, Brazil",
  "Mexico City International, MEX, Mexico City, Mexico",
  "Suvarnabhumi International, BKK, Bangkok, Thailand",
  "Incheon International, ICN, Seoul, South Korea",
  "Hong Kong International, HKG, Hong Kong",
  "Narita International, NRT, Tokyo, Japan",
  "Zurich Airport, ZRH, Zurich, Switzerland",
  "Istanbul Airport, IST, Istanbul, Turkey",
  "Vienna International, VIE, Vienna, Austria",
  "Brussels Airport, BRU, Brussels, Belgium",
  "Doha Hamad International, DOH, Doha, Qatar",
  "Vancouver International, YVR, Vancouver, Canada",
  "King Khalid International, RUH, Riyadh, Saudi Arabia",
  "Cairo International, CAI, Cairo, Egypt",
  "Johannesburg O.R. Tambo International, JNB, Johannesburg, South Africa",
  "Kuala Lumpur International, KUL, Kuala Lumpur, Malaysia",
  "Ninoy Aquino International, MNL, Manila, Philippines",
  "Indira Gandhi International, DEL, New Delhi, India",
  "Vienna International, VIE, Vienna, Austria",
  "Munich International, MUC, Munich, Germany",
  "Leonardo da Vinci International (Fiumicino), FCO, Rome, Italy",
  "Budapest Ferenc Liszt International, BUD, Budapest, Hungary",
  "Stockholm Arlanda, ARN, Stockholm, Sweden",
  "Copenhagen Airport, CPH, Copenhagen, Denmark",
  "Helsinki-Vantaa, HEL, Helsinki, Finland",
  "Athens International, ATH, Athens, Greece",
  "Lisbon Humberto Delgado, LIS, Lisbon, Portugal",
  "Malpensa Airport, MXP, Milan, Italy",
  "Brussels Airport, BRU, Brussels, Belgium"
];


List airports = [
  "JFK - John F. Kennedy International, New York, USA",
  "LGA - LaGuardia, New York, USA",
  "EWR - Newark Liberty International, Newark (NYC Area), USA",
  "ORD - O'Hare International, Chicago, USA",
  "ATL - Hartsfield-Jackson Atlanta International, Atlanta, USA",
  "LAX - Los Angeles International, Los Angeles, USA",
  "DFW - Dallas/Fort Worth International, Dallas, USA",
  "DEN - Denver International, Denver, USA",
  "SEA - Seattle-Tacoma International, Seattle, USA",
  "MIA - Miami International, Miami, USA",
  "BOS - Logan International, Boston, USA",
  "SFO - San Francisco International, San Francisco, USA",
  "IAD - Washington Dulles International, Washington, D.C., USA",
  "DCA - Ronald Reagan Washington National, Washington, D.C., USA",
  "YVR - Vancouver International, Vancouver, Canada",
  "YYZ - Toronto Pearson International, Toronto, Canada",
  "YUL - Montréal-Pierre Elliott Trudeau International, Montreal, Canada",
  "LHR - Heathrow Airport, London, UK",
  "LGW - Gatwick Airport, London, UK",
  "CDG - Charles de Gaulle Airport, Paris, France",
  "ORY - Orly Airport, Paris, France",
  "FRA - Frankfurt am Main Airport, Frankfurt, Germany",
  "MUC - Munich Airport, Munich, Germany",
  "AMS - Amsterdam Schiphol Airport, Amsterdam, Netherlands",
  "MAD - Adolfo Suárez Madrid–Barajas Airport, Madrid, Spain",
  "BCN - Barcelona-El Prat Airport, Barcelona, Spain",
  "FCO - Leonardo da Vinci–Fiumicino Airport, Rome, Italy",
  "MXP - Milan Malpensa Airport, Milan, Italy",
  "ZRH - Zurich Airport, Zurich, Switzerland",
  "VIE - Vienna International Airport, Vienna, Austria",
  "BRU - Brussels Airport, Brussels, Belgium",
  "DUB - Dublin Airport, Dublin, Ireland",
  "ARN - Stockholm Arlanda Airport, Stockholm, Sweden",
  "HND - Haneda Airport, Tokyo, Japan",
  "NRT - Narita International Airport, Tokyo, Japan",
  "PEK - Beijing Capital International Airport, Beijing, China",
  "PVG - Shanghai Pudong International Airport, Shanghai, China",
  "HKG - Hong Kong International Airport, Hong Kong",
  "ICN - Incheon International Airport, Seoul, South Korea",
  "SIN - Singapore Changi Airport, Singapore",
  "BKK - Suvarnabhumi Airport, Bangkok, Thailand",
  "DEL - Indira Gandhi International Airport, New Delhi, India",
  "BOM - Chhatrapati Shivaji Maharaj International Airport, Mumbai, India",
  "DXB - Dubai International Airport, Dubai, UAE",
  "AUH - Abu Dhabi International Airport, Abu Dhabi, UAE",
  "RUH - King Khalid International Airport, Riyadh, Saudi Arabia",
  "JED - King Abdulaziz International Airport, Jeddah, Saudi Arabia",
  "KUL - Kuala Lumpur International Airport, Kuala Lumpur, Malaysia",
  "CGK - Soekarno–Hatta International Airport, Jakarta, Indonesia",
  "MNL - Ninoy Aquino International Airport, Manila, Philippines",
  "JNB - O. R. Tambo International Airport, Johannesburg, South Africa",
  "CPT - Cape Town International Airport, Cape Town, South Africa",
  "LOS - Murtala Muhammed International Airport, Lagos, Nigeria",
  "CAI - Cairo International Airport, Cairo, Egypt",
  "NBO - Jomo Kenyatta International Airport, Nairobi, Kenya",
  "ADD - Addis Ababa Bole International Airport, Addis Ababa, Ethiopia",
  "CMN - Mohammed V International Airport, Casablanca, Morocco",
  "DSS - Blaise Diagne International Airport, Dakar, Senegal",
  "ACC - Kotoka International Airport, Accra, Ghana",
  "DAR - Julius Nyerere International Airport, Dar es Salaam, Tanzania",
  "SYD - Sydney Kingsford Smith Airport, Sydney, Australia",
  "MEL - Melbourne Airport, Melbourne, Australia",
  "BNE - Brisbane Airport, Brisbane, Australia",
  "AKL - Auckland Airport, Auckland, New Zealand",
  "CHC - Christchurch International Airport, Christchurch, New Zealand",
  "GRU - São Paulo-Guarulhos International Airport, São Paulo, Brazil",
  "GIG - Rio de Janeiro-Galeão International Airport, Rio de Janeiro, Brazil",
  "EZE - Ministro Pistarini International Airport, Buenos Aires, Argentina",
  "SCL - Arturo Merino Benítez International Airport, Santiago, Chile",
  "BOG - El Dorado International Airport, Bogotá, Colombia",
  "LIM - Jorge Chávez International Airport, Lima, Peru",
  "MVD - Carrasco International Airport, Montevideo, Uruguay",
  //   "ATL",
  //   "LAX",
  //   "DXB",
  //   "LHR",
  //   "HND",
  //   "CDG",
  //   "FRA",
  //   "SIN",
  //   "AMS",
  //   "DFW",
  //   "PEK",
  //   "MAD",
  //   "MIA",
  //   "YYZ",
  //   "SYD",
  // "CGK",
  // "GRU",
  // "MEX",
  // "BKK",
  // "ICN",
  // "HKG",
  // "NRT",
  // "ZRH",
  // "IST",
  // "VIE",
  // "BRU",
  // "DOH",
  // "YVR",
  // "RUH",
  // "CAI",
  // "JNB",
  // "KUL",
  // "MNL",
  // "DEL",
  // "VIE",
  // "MUC",
  // "FCO",
  // "BUD",
  // "ARN",
  // "CPH",
  // "HEL",
  // "ATH",
  // "LIS",
  // "MXP",
  // "BRU",
  // "NYC"
];

List flightOptionList = [
  "DUBAI",
  "NEW YORK CITY",
  "24-10-12",
  "",
  '1',
  '0',
  '0',
  "USD",
  "ECONOMY"
];
List flightOptionListSubtitle = [
  "origin",
  "destination",
  "departureDate",
  "returnDate",
  "numberOfAdult",
  "numberOfInfants",
  "numberOfChildren",
  "currency",
  "travelClass"
];

class SearchAndDisplay extends StatefulWidget {
  const SearchAndDisplay({super.key});

  @override
  State<SearchAndDisplay> createState() => _SearchAndDisplayState();
}

class _SearchAndDisplayState extends State<SearchAndDisplay> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
