import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      String origin,
      String destination,
      String departureDate,
      int numberOfAdult,
      bool? nonStop) async {
    await getAuthorization();
     dio.options.headers =  {"Content-Type": "application/x-www-form-urlencoded", "Authorization": "Bearer $accessToken"};
    dynamic searchList;
    try {
      Response response = await dio.get(
        "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&adults=$numberOfAdult&nonStop=$nonStop&max=250",
      );
      searchList = response.data["data"];
    } on DioException catch (e) {
      debugPrint("available flight error: $e");
    }
    debugPrint("this is the search list: $searchList");
    // return searchList;
  }
}
