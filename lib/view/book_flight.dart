import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/provider.dart';
import 'package:travel_app/service/dio_client.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/view/flight_offer_search.dart';
import '../utils/data_bank.dart';
import '../utils/font.dart';

class BookFlight extends StatefulWidget {
  const BookFlight({super.key});

  @override
  State<BookFlight> createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  ///LIST OF AIRPORT IATA CODE

  String? onChangeValue;
  List searchedList = [];
  String inputSearch = "";
  List searchResult = [];
  String tripType = "ONE WAY";
  String origin = "DUBAI";
  String destination = "NEW YORK CITY";
  String numberOfAdult = "1";
  String numberOfInfants = ' ';
  String numberOfChildren = ' ';
  String currency = "EUR";
  String travelClass = "ECONOMY";
  String nonStop = 'false';
  bool isSearching = false;

  String selectedDepartureDate = ' '; //DateTime.now().toString().split(' ')[0];
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

  TextEditingController originSearchController = TextEditingController();
  TextEditingController destinationSearchController = TextEditingController();

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
                        return ListTile(
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
                            title: Text("${searchedList[index]}"));
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
    originSearchController.text =
        "LOS - Murtala Muhammed International Airport, Lagos, Nigeria";
    destinationSearchController.text =
        "DXB - Dubai International Airport, Dubai, UAE";

    isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.to(() => const HomePage(),
        //         //transition: Transition.leftToRight,
        //         duration: const Duration(milliseconds: 600),
        //         curve: Curves.easeInOut);
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
        centerTitle: true,
        title: Text("Flight", style: kBoldNormal()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Center(child: Text("${context.watch<ChatListProvider>().chat}")),
              // Text("${context.watch<CounterProvider>().counter}"),
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
                                            numberOfAdult =
                                                (index + 1).toString();
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
                                            numberOfInfants =
                                                (index + 1).toString();
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
                                            numberOfChildren =
                                                (index + 1).toString();
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

              ///NONSTOP TILE
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
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    List nonStopValues = ['false', 'true'];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: InkWell(
                                          onTap: () {
                                            nonStop = nonStopValues[index];
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                              height: 30,
                                              child:
                                                  Text(nonStopValues[index]))),
                                    );
                                  }),
                            ],
                          ),
                        );
                      });
                },
                title: Text(
                  nonStop,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "non-stop  *",
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
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    List travelClassValues = [
                                      ' ',
                                      'ECONOMY',
                                      'PREMIUM_ECONOMY',
                                      'BUSINESS',
                                      'FIRST'
                                    ];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: InkWell(
                                          onTap: () {
                                            travelClass =
                                                travelClassValues[index];
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                              height: 30,
                                              child: Text(
                                                  travelClassValues[index]))),
                                    );
                                  }),
                            ],
                          ),
                        );
                      });
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
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Center(
                      child: isSearching
                          ? CircularProgressIndicator(
                              color: kOrange(),
                            )
                          : Text(
                              "Search",
                              style: TextStyle(
                                  color: kOrange(),
                                  fontWeight: FontWeight.w600),
                            )),
                ),
                onTap: () async {
                  setState(() {
                    isSearching = true;
                  });

                  GetStorage().write(
                      "editedOriginSearchController.textFromBookFlightClass",
                      originSearchController.text.split('-')[0].trim());
                  GetStorage().write(
                      "editedDestinationSearchController.textFromBookFlightClass",
                      destinationSearchController.text.split('-')[0].trim());
                  GetStorage().write("selectedDepartureDateFromBookFlightClass",
                      selectedDepartureDate);
                  GetStorage().write("selectedNumberOfAdults", numberOfAdult);
                  GetStorage().write("selectedReturnDate", selectedReturnDate);
                  GetStorage().write("selectedNonStop", nonStop);
                  GetStorage()
                      .write("selectedNumberOfChildren", numberOfChildren);
                  GetStorage()
                      .write("selectedNumberOfInfants", numberOfInfants);
                  GetStorage().write("selectedTravelClass", travelClass);
                  //await DioClient().testApi();
                  await DioClient().availableFlightOffers(
                    origin: GetStorage().read(
                        "editedOriginSearchController.textFromBookFlightClass"),
                    destination: GetStorage().read(
                        "editedDestinationSearchController.textFromBookFlightClass"),
                    departureDate: selectedDepartureDate == ' '
                        ? selectedDepartureDate =
                            DateTime.now().toString().split(' ')[0]
                        : GetStorage()
                            .read("selectedDepartureDateFromBookFlightClass"),
                    numberOfAdult: GetStorage().read("selectedNumberOfAdults"),
                    nonStop: GetStorage().read("selectedNonStop"),
                    // returnDate: GetStorage().read("selectedReturnDate"),
                    // numberOfChildren:
                    // GetStorage().read("selectedNumberOfChildren"),
                    // numberOfInfants:
                    //  GetStorage().read("selectedNumberOfInfants"),
                    // travelClass:  GetStorage().read("selectedTravelClass"),
                  );
                  debugPrint("The nonstop value is: $nonStop");
                  debugPrint("The return date is: $selectedReturnDate");
                  debugPrint("The number of children is: $numberOfChildren");
                  debugPrint("The number of Infants is: $numberOfInfants");
                  debugPrint("The travel class is: $travelClass");

                  dynamic searchResponse =
                      GetStorage().read("searchListResponseFromDioClientClass");
                  debugPrint("This is from GetStorage: $searchResponse");
                  if (GetStorage()
                          .read("searchListResponseFromDioClientClass") ==
                      null) {
                    const GetSnackBar(
                        title: "An error occurred; try again");
                  } else {
                    Get.to(() => const FlightOfferSearchDisplay());
                  }
                  setState(() {
                    isSearching = false;
                  });
                },
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
