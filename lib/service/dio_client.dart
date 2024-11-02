import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

class DioClient {
  final Dio dio = Dio();
  String baseUrl = "https://test.api.amadeus.com/v2/shopping/flight-offers";
  String authorizationUrl =
      "https://test.api.amadeus.com/v1/security/oauth2/token";
  String? accessToken;
  Map<String, dynamic> data = {
    "grant_type": dotenv.get("GRANT_TYPE"),
    "client_id": dotenv.get("CLIENT_ID"),
    "client_secret": dotenv.get("CLIENT_SECRET")
  };

  Future<String> getAuthorization() async {
    dio.options.headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      Response response = await dio.post(
        authorizationUrl,
        data: data,
      );
      accessToken = response.data['access_token'];
    } on DioException catch (e) {
      debugPrint("this is the error thrown: $e");
    }
    debugPrint("this is the grant_type: ${data["grant_type"]}");
    debugPrint("this is the token: $accessToken");
    return accessToken!;
  }

  Future testApi() async {
    await getAuthorization();
    dio.options.headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $accessToken"
    };
    Response response = await dio.get(
        "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=SYD&destinationLocationCode=BKK&departureDate=2024-10-29&adults=1&nonStop=false&max=250");
    dynamic apiData = response.data["data"];
    debugPrint("this is the data from the tested API : $apiData");
    int testedApiStatusCode = response.statusCode!;
    debugPrint(
        "this is the status code for the tested API: $testedApiStatusCode");

    return;
  }

  Future<dynamic> availableFlightOffers(
      //{required String origin, required String destination, required String departureDate, required bool nonStop}
      {required String origin,
      required String destination,
      required String departureDate,
      required String numberOfAdult,
      required String nonStop,
      String? returnDate,
      String? numberOfChildren,
      String? numberOfInfants,
      String? travelClass,
      String? currency,
     // String? maxPrice,
      }) async {
    await getAuthorization();
    dio.options.headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $accessToken"
    };

    Map<String, dynamic> queryParameter = {
      "originLocationCode": origin,
      "destinationLocationCode": destination,
      "departureDate": departureDate,
      "adults": numberOfAdult,
      "nonStop": nonStop,
      if (returnDate != null) "returnDate": returnDate,
      if (numberOfChildren != null) "children": numberOfChildren,
      if (numberOfInfants != null) "infants": numberOfInfants,
      if (travelClass != null) "travelClass": travelClass,
      if (currency != null) "currencyCode": currency,
     // if (maxPrice != null) "maxPrice": maxPrice,

    };

    // Map<String, dynamic> queryParameter = {
    //   "originLocationCode": origin,
    //   "destinationLocationCode": destination,
    //   "departureDate": departureDate,
    //   "nonStop": nonStop.toString(),
    // };
    try {
      // Response response = await dio.get(queryParameters: queryParameters,
      //     "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&returnDate=$returnDate&adults=$numberOfAdult&children=1&infants=1&travelClass=ECONOMY&nonStop=false&currencyCode=USD&maxPrice=100000&max=250");
      ///ANOTHER API WITH INCOMPLETE PARAMATER
      // Response response = await dio.get(
      //   "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&adults=$numberOfAdult&nonStop=$nonStop&max=250",
      // );

      Response response = await dio.get(baseUrl,
          // "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&adults=1&nonStop=$nonStop&max=250",
          queryParameters: queryParameter);

      dynamic searchList = response.data;
      int searchListStatusCode = response.statusCode!;
      debugPrint(
          "this is the status code for the searchList: $searchListStatusCode");
      debugPrint("this is the search list: $searchList");
      GetStorage()
          .write("searchListResponseFromDioClientClass", searchList['data']);
      // debugPrint("this is the origin: $origin");
    } on DioException catch (e) {
      debugPrint("available flight error: $e");
      Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 5),
          icon: const Icon(
            Icons.error,
            color: Colors.orange,
          ),
          titleText: const Text(
            "Error",
            style: TextStyle(color: Colors.orange),
          ),
          title: "Error",
          message:
              "$e...Something went wrong. Make sure fields marked with asterisks are selected");
    }

    return;
  }
}
