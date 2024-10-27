import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/provider.dart';
import 'package:travel_app/service/dio_client.dart';
import 'package:travel_app/utils/colors.dart';

import '../utils/font.dart';

class BookFlight extends StatefulWidget {
  const BookFlight({super.key});

  @override
  State<BookFlight> createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  ///LIST OF AIRPORT IATA CODE
  List airports = [
    "ATL",
    "LAX",
    "DXB",
    "LHR",
    "HND",
    "CDG",
    "FRA",
    "SIN",
    "AMS",
    "DFW",
    "PEK",
    "MAD",
    "MIA",
    "YYZ",
    "SYD",
    "CGK",
    "GRU",
    "MEX",
    "BKK",
    "ICN",
    "HKG",
    "NRT",
    "ZRH",
    "IST",
    "VIE",
    "BRU",
    "DOH",
    "YVR",
    "RUH",
    "CAI",
    "JNB",
    "KUL",
    "MNL",
    "DEL",
    "VIE",
    "MUC",
    "FCO",
    "BUD",
    "ARN",
    "CPH",
    "HEL",
    "ATH",
    "LIS",
    "MXP",
    "BRU",
    "NYC"
  ];

  String? onChangeValue;
  List searchedList = [];
  String inputSearch = "";
  List searchResult = [];
  String tripType = "ONE WAY";
  String origin = "DUBAI";
  String destination = "NEW YORK CITY";
  String numberOfAdult = "1";
  String numberOfInfants = '0';
  String numberOfChildren = '0';
  String currency = "USD";
  String travelClass = "ECONOMY";

  String selectedDepartureDate = ''; //DateTime.now().toString().split(' ')[0];
  String selectedReturnDate = ' ';
  DateFormat? dateFormat;

  ///DATE SELECTION FUNCTION
  Future<String> selectDepartureDate() async {
    DateTime? pickedDepartureDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    selectedDepartureDate = pickedDepartureDate!.toString().split(' ')[0];
    setState(() {});
    return selectedDepartureDate;
  }

  Future<String> selectReturnDate() async {
    DateTime? pickedReturnDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    selectedReturnDate = pickedReturnDate!.toString().split(' ')[0];
    setState(() {});
    return selectedReturnDate;
  }

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
  TextEditingController originSearchController = TextEditingController();
  TextEditingController destinationSearchController = TextEditingController();

  ///UNUSED SHOWMODALBOTTOMSHEET BECAUSE THIS ITERATES AND NOT SUITABLE YET
  // void showBottomSheet() {
  //   showModalBottomSheet(
  //       // isScrollControlled: true,
  //       context: context,
  //       builder: (context) => DraggableScrollableSheet(
  //           initialChildSize: 1,
  //           builder: (context, scrollController) {
  //             return Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //               child: Column(
  //                 children: [
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   TextFormField(
  //                       // controller: airportSearchController,
  //                       decoration: const InputDecoration(
  //                         labelText: "Search",
  //                         icon: Icon(Icons.search),
  //                       ),
  //                       onChanged: (value) {
  //                         searchAirports(value);
  //                         debugPrint(
  //                             "This is the second searchedList: $searchedList");
  //                       }),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Expanded(
  //                     child:
  //                         //Text("${airports.map((e) => e)}"), //airports.map((e) => Text(e)).toList();
  //                         ListView.builder(
  //                       itemCount: searchedList.length,
  //                       // itemCount: airports.length,
  //                       itemBuilder: (cont, index) {
  //                         return Text("${searchedList[index]}");
  //                         // return Text("${searchedList[index]}");
  //                         // return Text(searchedList[index]);
  //                         // return ;
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           }));
  // }

  ///BOOKFLIGHTOPTIONS .  AUTOBUILDS THE LIST OF OPTIONS TO SELECT FOR YOUR FLIGHT BOOKING
  Widget bookFlightOptions() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: flightOptionList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              onTap: () {
                setState(() {
                  onChangeValue = flightOptionList[index];
                  debugPrint("this is the onChangeValue: $onChangeValue");
                });

                if (index == 2 || index == 3) {
                  context
                      .read<ChangeOriginProvider>()
                      .changeOrigin(flightOptionList[index]);
                  //  showCalender();
                } // else //if(index == ){}
                //showBottomSheet();
              },
              title: Text(
                context
                    .watch<ChangeOriginProvider>()
                    .origin, // flightOptionList[index],
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                flightOptionListSubtitle[index],
                style: const TextStyle(color: Colors.white),
              ),
              tileColor: Colors.teal,
            ),
          );
        });
  }

  ///FUNCTION TO SHOW BOTTOM SHEET . TAKES IN A PARAMETER: TextEditingController for each option used in Origin and Destination
  void showBottomSheet(TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "Search",
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setModalState(() {
                          searchAirports(value);
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchedList.length,
                      itemBuilder: (cont, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {});
                              setModalState(() {
                                controller.text = searchedList[index];
                                context
                                    .read<ChangeOriginProvider>()
                                    .changeOrigin(originSearchController.text);
                              });
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Text("${searchedList[index]}"));
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  ///BOTTOMSHEET SEARCH FUNCTION
  List searchAirports(String input) {
    inputSearch = input;
    searchedList = airports
        .where((airport) =>
            airport.toUpperCase().contains(inputSearch.toUpperCase()))
        .toList();
    return searchedList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    originSearchController.text = "DUBAI";
    destinationSearchController.text = "NEW YORK CITY";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Flight", style: kBoldNormal()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(child: Text("${context.watch<ChatListProvider>().chat}")),
              Text("${context.watch<CounterProvider>().counter}"),
              const Text("Asterisk (*) indicate compulsory options",
                  style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                color: Colors.teal,
                width: double.infinity,
                height: 50,
                child: Center(
                  child: DropdownMenu(
                    onSelected: (value) {
                      tripType = value!;
                    },
                    width: MediaQuery.of(context).size.width,
                    textStyle: const TextStyle(color: Colors.white),
                    menuStyle: MenuStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(900, 35)),
                      surfaceTintColor: MaterialStateProperty.all(Colors.white),
                    ),
                    inputDecorationTheme:
                        const InputDecorationTheme(border: InputBorder.none),
                    label: const Text(
                      "Trip type  *",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailingIcon: const Icon(
                      Icons.add,
                      size: 0,
                    ),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: "ONE WAY", label: "ONE WAY"),
                      DropdownMenuEntry(
                          value: "ROUND TRIP", label: "ROUND TRIP"),
                      DropdownMenuEntry(
                          value: "MULTI CITY", label: "MULTI CITY"),
                    ],
                  ),

                  ///INSTEAD OF DROPDOWNMENU, DROPDOWNBUTTON CAN BE USED. I PREFER DROPDOWNMENU BECAUSE OF THE POSITIONING OF THE MENU
                  // DropdownButton(
                  //   iconSize: 0,
                  //     underline: const Text(""),
                  //     dropdownColor: Colors.black,
                  //     style: const TextStyle(color: Colors.white),
                  //     value: tripType,
                  //     items: const [
                  //       DropdownMenuItem(
                  //         value: "ONE WAY",
                  //         child: Text("ONE WAY"),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: "ROUND TRIP",
                  //         child: Text("ROUND TRIP"),
                  //       ),
                  //       DropdownMenuItem(
                  //           value: "MULTI CITY", child: Text("MULTI CITY")),
                  //     ],
                  //     onChanged: (String? value) {
                  //       setState(() {
                  //         tripType = value!;
                  //       });
                  //     }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // bookFlightOptions()

              ///ORIGIN LIST TILE
              ListTile(
                onTap: () {
                  showBottomSheet(originSearchController);
                  originSearchController.clear();
                  searchedList = [];
                },
                title: Text(
                  originSearchController.text,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "origin  *",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///DESTINATION LIST TILE
              ListTile(
                onTap: () {
                  showBottomSheet(destinationSearchController);
                  destinationSearchController.clear();
                  searchedList = [];
                },
                title: Text(
                  destinationSearchController.text,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "destination  *",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///DEPARTURE DATE TILE
              ListTile(
                onTap: () {
                  selectDepartureDate();
                },
                title: Text(
                  selectedDepartureDate,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "departure date  *",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///RETURN DATE TILE
              ListTile(
                onTap: () {
                  selectReturnDate();
                },
                title: Text(
                  selectedReturnDate,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Return date",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///NUMBER OF ADULT TILE
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: InkWell(
                                          onTap: () {
                                            numberOfAdult = (index + 1).toString();
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                              height: 30,
                                              child: Text("${index + 1}"))),
                                    );
                                  }),
                            ],
                          ),
                        );
                      });
                },
                title: Text(
                  numberOfAdult,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Number of Adult  *",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///NUMBER OF INFANTS TILE
              ListTile(
                title: Text(
                  numberOfInfants,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Number of Infants",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///NUMBER OF CHILDREN TILE
              ListTile(
                title: Text(
                  numberOfChildren,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Number of children",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///CURRENCY TILE
              ListTile(
                title: Text(
                  currency,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Currency",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),

              ///TRAVEL CLASS TILE
              ListTile(
                onTap: (){
                 // DioClient().availableFlightOffers(origin: "SYD", destination: "BKK", departureDate: "2024-10-29", numberOfAdult: "1");
                },
                title: Text(
                  travelClass,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Travel class",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.teal,
              ),

              const SizedBox(
                height: 10,
              ),

              ///SEARCH BUTTON
              InkWell(
                onTap: () async{
                  try{
                    await DioClient().availableFlightOffers(
                        origin: origin,
                        destination: destination,
                        departureDate: selectedDepartureDate,
                        numberOfAdult: numberOfAdult);
                  }catch (e){
                    Get.rawSnackbar(
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 5),
                        icon: const Icon(Icons.error,color: Colors.orange,),
                        titleText: const Text(
                          "Error",
                          style: TextStyle(color: Colors.orange),
                        ),
                        title: "Error",
                        message:
                        "$e...Something went wrong. Make sure fields marked with asterisks are selected");
                  }
                  debugPrint("$origin $destination $selectedDepartureDate $numberOfAdult");

                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Center(
                      child: Text(
                    "Search",
                    style: TextStyle(color: kOrange()),
                  )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
