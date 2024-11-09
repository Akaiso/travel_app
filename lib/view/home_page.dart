import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/font.dart';
import 'package:travel_app/view/book_flight.dart';
import 'package:travel_app/widgets/card_with_double_rows.dart';
import 'package:travel_app/widgets/card_with_single_row.dart';
import 'package:travel_app/widgets/card_with_two_sections.dart';
import 'package:travel_app/widgets/drawer.dart';
import 'package:travel_app/widgets/dropdown_button.dart';
import 'package:travel_app/widgets/flight_offers_card.dart';
import 'package:travel_app/widgets/footer.dart';
import 'package:travel_app/widgets/footer_appendix.dart';
import 'package:travel_app/widgets/hover_effect_button.dart';
import 'package:travel_app/widgets/scroll_to_top_indicator.dart';
import '../widgets/carousel.dart';
import '../widgets/modal.dart';
import '../widgets/service_tabs.dart';
import '../widgets/suggestion_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollControllerHome = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color color = Colors.orange;
  String feel = ' happy ';
  bool isVisibleFlight = false;
  bool isVisibleHotel = false;
  late Color flightColor;
  late Color hotelColor;
  bool flightRow = true;
  bool hotelRow = false;
  Color textHoverColor1 = Colors.black;
  Color textHoverColor2 = Colors.black;
  Color textHoverColor3 = Colors.black;

  //external
  bool _isFlightSelected = true; // initially, flight is selected by default
  bool _isFlightHovered = false;
  bool _isHotelHovered = false;

  // late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flightColor = Colors.black;
    // videoPlayerController =
    //     VideoPlayerController.asset("assets/videos/page_loading_video1.mp4");
    // videoPlayerController.addListener(() {
    //   setState(() {});
    // });
    // videoPlayerController.setLooping(true);
    // videoPlayerController.initialize().then((value) => setState(() {}));
    // videoPlayerController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> flightOffersModelList = [
      const FlightOffersModel(
        imageLink: "assets/images/001.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Dubai',
        ticketFare: '₦ 1,300,456',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/002.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> France',
        ticketFare: '₦ 2,100,000',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/003.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Cape Verd',
        ticketFare: '₦ 900,500',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/004.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> California',
        ticketFare: '₦ 2,500,000',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/005.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Toronto',
        ticketFare: '₦ 2,800,500',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/006.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Singapore',
        ticketFare: '₦ 3,500,00',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/007.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Brazil',
        ticketFare: '₦ 1,800,000',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/008.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Turkey',
        ticketFare: '₦ 2,2000,300',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/009.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Johannesburg',
        ticketFare: '₦ 1,750,999',
      ),
      const FlightOffersModel(
        imageLink: "assets/images/010.png",
        tripType: "ONE WAY",
        fromTo: 'Lagos -> Moscow',
        ticketFare: '₦ 3,800,000',
      ),
    ];

    List<Widget> flightOffers = flightOffersModelList.map((e) => e).toList();

    Row hotelRowRow1 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h1.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h2.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h3.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h4.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h5.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h6.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h7.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h8.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h9.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h10.jfif", fit: BoxFit.cover),
          ),
        ),
      ],
    );
    Row hotelRowRow2 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h11.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h12.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h13.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h14.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h15.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h16.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h17.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h18.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h19.jfif", fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width < 800
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: Image.asset("assets/images/h20.jfif", fit: BoxFit.cover),
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerClass(),
        floatingActionButton: ScrollToTopButton(
          scrollController: scrollControllerHome,
        ),
        body: SingleChildScrollView(
          controller: scrollControllerHome,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  /// APP NAVIGATION BAR
                  Container(
                    height: MediaQuery.of(context).size.width < 800 ? 480 : 740,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage('assets/images/airport.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width < 800
                                  ? 100
                                  : null,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width <
                                                    800
                                                ? 60
                                                : 100,
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    800
                                                ? 60
                                                : 200,
                                        child:
                                            MediaQuery.of(context).size.width <
                                                    800
                                                ? Image.asset(
                                                    'assets/images/standalonelogo.png',
                                                    fit: BoxFit.scaleDown,
                                                  )
                                                : Image.asset(
                                                    'assets/images/logo.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                                  Expanded(
                                    flex:
                                        MediaQuery.of(context).size.width < 800
                                            ? 1
                                            : 3,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child:
                                            MediaQuery.of(context).size.width <
                                                    800
                                                ? const SizedBox.shrink()
                                                : FittedBox(
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Flight ",
                                                            'assets/images/flight.png',
                                                            Colors.white),
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Stays ",
                                                            "assets/images/hotel.png",
                                                            Colors.white),
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Cruise ",
                                                            "assets/images/cruise.png",
                                                            Colors.white),
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Visa ",
                                                            "assets/images/visa.png",
                                                            Colors.white),
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Rides ",
                                                            'assets/images/rides.png',
                                                            Colors.white),
                                                        offeredServicesTabsNavigator(
                                                            () {},
                                                            " Holidays",
                                                            'assets/images/holiday.png',
                                                            Colors.white),
                                                      ],
                                                    ),
                                                  ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: MediaQuery.of(context).size.width <
                                              800
                                          ? 3
                                          : 1,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    800
                                                ? 300
                                                : 100,
                                        height: 150,
                                        child: MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                800
                                            ? Container(
                                                color: Colors.transparent,
                                                width: 700,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Expanded(
                                                        child:
                                                            MyAccountDropdown()),

                                                    ///THE MENU  (HAMBURGER)
                                                    Expanded(
                                                      child: IconButton(
                                                          onPressed: () {
                                                            _scaffoldKey
                                                                .currentState
                                                                ?.openDrawer();
                                                          },
                                                          icon: const Icon(
                                                            Icons.menu,
                                                            color: Colors.white,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: LanguageDropdown(),
                                                  ),
                                                  Expanded(
                                                      child:
                                                          MyAccountDropdown())
                                                ],
                                              ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                              replacement: const SizedBox.shrink(),
                              visible: MediaQuery.of(context).size.width < 800
                                  ? true
                                  : false,
                              child: Center(
                                child: FittedBox(
                                  child: SizedBox(
                                    width: 400,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 4,
                                      runSpacing: 4,
                                      children: [
                                        offeredServicesTabsNavigator(() {
                                          Get.to(() => const BookFlight(),
                                              transition:
                                                  Transition.rightToLeft,
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              curve: Curves.easeInOut);
                                          // DioClient().availableFlightOffers(origin: "DXB", destination: "LON", departureDate: "2024-10-24", numberOfAdult: 1, nonStop: false);
                                        },
                                            " Flight ",
                                            'assets/images/flight.png',
                                            Colors.white),
                                        offeredServicesTabsNavigator(() {
                                          showDialog(
                                              context: this.context,
                                              builder: (context) =>
                                                  const CustomModal());
                                        }, " stays ", "assets/images/hotel.png",
                                            Colors.white),
                                        offeredServicesTabsNavigator(() {
                                          showDialog(
                                              context: this.context,
                                              builder: (context) =>
                                                  const CustomModal());
                                        },
                                            " Cruise ",
                                            "assets/images/cruise.png",
                                            Colors.white),
                                        offeredServicesTabsNavigator(() {
                                          showDialog(
                                              context: this.context,
                                              builder: (context) =>
                                                  const CustomModal());
                                        }, " Visa ", "assets/images/visa.png",
                                            Colors.white),
                                        offeredServicesTabsNavigator(() {
                                          showDialog(
                                              context: this.context,
                                              builder: (context) =>
                                                  const CustomModal());
                                        }, " Rides ", 'assets/images/rides.png',
                                            Colors.white),
                                        offeredServicesTabsNavigator(() {
                                          showDialog(
                                              context: this.context,
                                              builder: (context) =>
                                                  const CustomModal());
                                        },
                                            " Holiday",
                                            'assets/images/holiday.png',
                                            Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),

                  /// TRIP OPTIONS CARD MAIN
                  Visibility(
                    replacement: const SizedBox(),
                    visible:
                        MediaQuery.of(context).size.width < 800 ? false : true,
                    child: Positioned(
                      top: 300,
                      left: 50,
                      right: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.black26),
                          color: Colors.white70,
                        ),
                        height: 310, //MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: const FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              HoverEffectButton(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 13,
                                                  text: 'One Way'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              HoverEffectButton(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 13,
                                                  text: 'Round Trip'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              HoverEffectButton(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 13,
                                                  text: 'Multi City'),
                                              SizedBox(
                                                width: 10,
                                              ),

                                              //DropdownButton to select flight class
                                              FlightCategorySelectionDropdown(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: const Text(
                                              'Book International and Domestic flights'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              ///TRIP SELECTION OPTION SUB-CARD
                              Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: double.infinity, //140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: tripSearchDisplayOption(
                                            0.5,
                                            Colors.black26,
                                            'From',
                                            Container(),
                                            'Select City',
                                            '',
                                            ''),
                                      ),
                                      Expanded(
                                        child: tripSearchDisplayOption(
                                            0.5,
                                            Colors.black26,
                                            'to',
                                            Container(),
                                            'Select City',
                                            '',
                                            ''),
                                      ),
                                      Expanded(
                                        child: tripSearchDisplayOption(
                                            0.5,
                                            Colors.black26,
                                            'Departure',
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_drop_down_sharp)),
                                            '2',
                                            "Aug'24",
                                            'Friday'),
                                      ),
                                      Expanded(
                                        child: tripSearchDisplayOption(
                                            0.5,
                                            Colors.black26,
                                            'Return',
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_drop_down_sharp)),
                                            '4',
                                            "Aug'24",
                                            'Sunday'),
                                      ),
                                      Expanded(
                                        child: tripSearchDisplayOption(
                                            0,
                                            Colors.transparent,
                                            'Passenger',
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_drop_down_sharp)),
                                            '1',
                                            'Passenger',
                                            ''),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///MAJOR SEARCH BUTTON
                  Visibility(
                    replacement: const SizedBox.shrink(),
                    visible:
                        MediaQuery.of(context).size.width < 800 ? false : true,
                    child: Positioned(
                      top:
                          580, //MediaQuery.of(context).size.width < 1000 ? 555 : 590,
                      left: MediaQuery.of(context).size.width * 0.40,
                      right: MediaQuery.of(context).size.width * 0.40,
                      child: SizedBox(
                        height: 50,
                        child: HoverEffectButton(
                          onTap: () {
                            Get.to(() => const BookFlight());
                          },
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          text: 'Search',
                        ),
                      ),
                    ),
                  ),

                  ///SUGGESTION INFO
                  Visibility(
                    visible:
                        MediaQuery.of(context).size.width < 800 ? false : true,

                    ///SUGGESTION INFO <800
                    replacement: Positioned(
                      top: 380,
                      right: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SuggestionInfo(
                              iconString: 'assets/images/luggage.png',
                              titleString: 'Holiday Escape',
                              subtitleString:
                                  "Have you always wanted a place to 'japa' to without \n breaking the bank, we have special offers here",
                            ),
                            SuggestionInfo(
                              iconString: 'assets/images/wallet.png',
                              titleString: 'Pay Small Small',
                              subtitleString:
                                  "Secure best travel deals and pay in convenient \n installments",
                            ),
                            SuggestionInfo(
                              iconString: 'assets/images/map.png',
                              titleString: 'Travel Guide',
                              subtitleString:
                                  "Travel like a pro ; don't look like a first timer \n",
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///SUGGESTION INFO >800
                    child: Positioned(
                      top: 700,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 7,
                        child: PhysicalModel(
                          elevation: 10,
                          shadowColor: Colors.black45,
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          child: Center(
                              child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SuggestionInfo(
                                  iconString: 'assets/images/luggage.png',
                                  titleString: 'Holiday Escape',
                                  subtitleString:
                                      "Have you always wanted a place to 'japa' to without \n breaking the bank, we have special offers here",
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black26,
                                  height: 70,
                                ),
                                const SuggestionInfo(
                                  iconString: 'assets/images/wallet.png',
                                  titleString: 'Pay Small Small',
                                  subtitleString:
                                      "Secure best travel deals and pay in convenient \n installments",
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black26,
                                  height: 70,
                                ),
                                const SuggestionInfo(
                                  iconString: 'assets/images/map.png',
                                  titleString: 'Travel Guide',
                                  subtitleString:
                                      "Travel like a pro ; don't look like a first timer \n",
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 800 ? 120 : 50,
              ),

              ///  CAROUSEL SLIDER
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: MultiImageCarousel(),
              ),

              const SizedBox(
                height: 30,
              ),

              ///Card with Double Rows
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 800 ? 0 : 20.0),
                child: CardWithDoubleRows(
                  headerRow: FittedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 80,
                      child: MediaQuery.of(context).size.width < 800
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Offers',
                                  style: kBoldNormal(), //subtitle(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      MouseRegion(
                                        onEnter: (_) => setState(() {
                                          _isFlightHovered = true;
                                        }),
                                        onExit: (_) => setState(() {
                                          _isFlightHovered = false;
                                        }),
                                        child: SizedBox(
                                          width: 70,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isFlightSelected = true;
                                              });
                                            },
                                            child: Column(children: [
                                              Text(
                                                'Flights',
                                                style: TextStyle(
                                                    color: (_isFlightSelected ||
                                                            _isFlightHovered)
                                                        ? Colors.orange
                                                        : Colors.blue),
                                              ),
                                              AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  height: 2,
                                                  color: (_isFlightSelected ||
                                                          _isFlightHovered)
                                                      ? Colors.orange
                                                      : Colors.transparent,
                                                  margin: const EdgeInsets.only(
                                                      top: 4))
                                            ]),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      MouseRegion(
                                        onEnter: (_) => setState(() {
                                          _isHotelHovered = true;
                                        }),
                                        onExit: (_) => setState(() {
                                          _isHotelHovered = false;
                                        }),
                                        child: SizedBox(
                                          width: 70,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isFlightSelected = false;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Hotel',
                                                  style: TextStyle(
                                                      color:
                                                          (!_isFlightSelected ||
                                                                  _isHotelHovered)
                                                              ? Colors.orange
                                                              : Colors.blue),
                                                ),
                                                AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  height: 2,
                                                  color: (!_isFlightSelected ||
                                                          _isHotelHovered)
                                                      ? Colors.orange
                                                      : Colors.transparent,
                                                  margin: const EdgeInsets.only(
                                                      top: 4),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Column(),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  'Offers',
                                  style: kBoldSubtitle2(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MouseRegion(
                                  onEnter: (_) => setState(() {
                                    _isFlightHovered = true;
                                  }),
                                  onExit: (_) => setState(() {
                                    _isFlightHovered = false;
                                  }),
                                  child: SizedBox(
                                    width: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isFlightSelected = true;
                                        });
                                      },
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Flights',
                                              style: TextStyle(
                                                  color: (_isFlightSelected ||
                                                          _isFlightHovered)
                                                      ? Colors.orange
                                                      : Colors.blue),
                                            ),
                                            AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                height: 2,
                                                color: (_isFlightSelected ||
                                                        _isFlightHovered)
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                margin: const EdgeInsets.only(
                                                    top: 4))
                                          ]),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                MouseRegion(
                                  onEnter: (_) => setState(() {
                                    _isHotelHovered = true;
                                  }),
                                  onExit: (_) => setState(() {
                                    _isHotelHovered = false;
                                  }),
                                  child: SizedBox(
                                    width: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isFlightSelected = false;
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Hotel',
                                            style: TextStyle(
                                                color: (!_isFlightSelected ||
                                                        _isHotelHovered)
                                                    ? Colors.orange
                                                    : Colors.blue),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            height: 2,
                                            color: (!_isFlightSelected ||
                                                    _isHotelHovered)
                                                ? Colors.orange
                                                : Colors.transparent,
                                            margin:
                                                const EdgeInsets.only(top: 4),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // const Column(),
                              ],
                            ),
                    ),
                  ),
                  row1: _isFlightSelected
                      ? Row(children: flightOffers)
                      : hotelRowRow1, //flightRow ? flightRowRow : hotelRowRow,
                  row2: _isFlightSelected
                      ? Row(children: flightOffers)
                      : hotelRowRow2, //flightRow ? flightRowRow : hotelRowRow,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ///Card with Left & Right Sections
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 800 ? 0 : 20.0),
                child: CardWithDoubleSection(
                  firstSection: MediaQuery.of(context).size.width < 800
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 25),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FittedBox(
                                  child: Text(
                                    'Get the Trip Guard app',
                                    style: kTitle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                    'Download our Mobile App free today to book your flights, hotels, \nand visa '
                                    'and get amazing deals on the go'),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          hintText: 'Enter your email address',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          )),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.orange,
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: Text('Send App Link',
                                            style: kBoldWhiteNormal()),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 150,
                                  width: 500,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                              height: 50,
                                              width: 200,
                                              child: Image.asset(
                                                  'assets/images/playstore.png')),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              height: 50,
                                              width: 200,
                                              child: Image.asset(
                                                  'assets/images/appstore.png')),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              height:
                                                  180, //MediaQuery.of(context).size.height * 0.2 ,
                                              width: 50,
                                              child: Image.asset(
                                                  'assets/images/qrcode.png')),
                                        )
                                      ]),
                                ),
                              ]),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Get the Trip Guard app',
                                  style: kTitle(),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                  'Download our Mobile App free today to book your flights, hotels, \n and visas'
                                  'and get amazing deals on the go'),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 500,
                                height: 35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 10, top: 5),
                                            hintText:
                                                'Enter your email address',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Container(
                                          height: 35,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.orange,
                                          ),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text('Send App Link',
                                                  style: kWhiteNormal()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                  secondSection: MediaQuery.of(context).size.width < 800
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 200,
                                        child: Image.asset(
                                            'assets/images/playstore.png')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        height: 50,
                                        width: 200,
                                        child: Image.asset(
                                            'assets/images/appstore.png')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  height:
                                      180, //MediaQuery.of(context).size.height * 0.2 ,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child:
                                      Image.asset('assets/images/qrcode.png'))
                            ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ///CARD WITH SINGLE ROW (EXPLORE HOTELS IN TRENDING DESTINATIONS)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 800 ? 0 : 20.0),
                child: CardWithSingleRow(
                  headerRow: FittedBox(
                    child: MediaQuery.of(context).size.width < 800
                        ? Text(
                            'Explore Hotels in \ntrending Destinations',
                            style: kTitle(),
                          )
                        : Text(
                            'Explore Hotels in trending Destinations',
                            style: kTitle(),
                          ),
                  ),
                  row1: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.9
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh1.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              'assets/images/eh2.jfif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh3.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh4.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh5.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh6.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh7.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh8.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh9.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: MediaQuery.of(context).size.width < 800
                                ? MediaQuery.of(context).size.width * 0.8
                                : MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/eh10.jfif',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ///CARD WITH LEFT & RIGHT SECTION N0.2
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 800 ? 0 : 20.0),
                child: CardWithDoubleSection(
                    firstSection: MediaQuery.of(context).size.width < 800
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                // width: MediaQuery.of(context).size.width * 0.4,
                                height: 300,
                                width: double.infinity,
                                child: Image.asset(
                                    'assets/images/dubaiwaterline.jpeg',
                                    fit: BoxFit.fitHeight),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Subscribe to travel deals',
                                  style: kTitle(),
                                ),
                              ),
                              const Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      "Like travel deals,enter your email and we'll send them your way', and visas and get amazing deals on the go"),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SizedBox(
                                  // width: MediaQuery.of(context).size.width,
                                  height: 35,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10, top: 5),
                                              hintText:
                                                  'Enter your email address',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          child: InkWell(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors.orange,
                                              ),
                                              child: Center(
                                                  child: Text('Subscribe',
                                                      style:
                                                          kBoldWhiteNormal())),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : SizedBox(
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              'assets/images/dubaiwaterline.jpeg',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                    secondSection: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                'Subscribe to travel deals',
                                style: kTitle(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Flexible(
                              child: Text(
                                  "Like travel deals,enter your email and we'll send them your way', and visas and get amazing deals on the go"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 10, top: 5),
                                            hintText:
                                                'Enter your email address',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            )),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    child: InkWell(
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Colors.orange,
                                        ),
                                        child: Center(
                                            child: Text('Subscribe',
                                                style: kWhiteNormal())),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FittedBox(
                    child: Text("Cheap flights from Nigeria",
                        style: kBoldSmall2())),
              ),
              const SizedBox(height: 20),
              const CheapFlightsLayout(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FittedBox(
                    child: Text("Book Cheap Hotels", style: kBoldSmall2())),
              ),
              const BookCheapHotelsLayout(),
              const SizedBox(height: 50),
              const AirlinesLayout1(),
              const SizedBox(height: 30),
              const AirlinesLayout2(),
              const SizedBox(height: 30),
              const Footer(),
              // Center(
              //   child: SizedBox(
              //     width: 300,
              //     height: 300,
              //     child: AspectRatio(
              //         aspectRatio: videoPlayerController.value.aspectRatio,
              //         child: VideoPlayer(videoPlayerController)),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
