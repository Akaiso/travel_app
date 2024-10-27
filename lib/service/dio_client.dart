import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DioClient {
  final Dio dio = Dio();
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

  Future availableFlightOffers(
      {required String origin,
      required String destination,
      required String departureDate,
      required String numberOfAdult,
      bool? nonStop,
      String? returnDate,
      int? numberOfChildren,
      int? numberOfInfants,
      String? travelClass,
      String? currency,
      int? maxPrice}) async {
    await getAuthorization();
    dio.options.headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $accessToken"
    };
    dynamic searchList = [];
    try {
      Response response = await dio.get(
          "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&returnDate=$returnDate&adults=$numberOfAdult&children=$numberOfChildren&infants=$numberOfInfants&travelClass=$travelClass&nonStop=$nonStop&currencyCode=$currency&maxPrice=$maxPrice&max=250");
      ///ANOTHER API WITH INCOMPLETE PARAMATER
      // Response response = await dio.get(
      //   "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&adults=$numberOfAdult&nonStop=$nonStop&max=250",
      // );
       searchList = response.data["data"];
    } on DioException catch (e) {
      debugPrint("available flight error: $e");
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
    debugPrint("this is the search list: $searchList");
    // return searchList;
  }
}
