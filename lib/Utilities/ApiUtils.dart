import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';



class apiManager {

  Future<String> GetFlightOffers_() async {
    final response =
    await http.get(
        'https://us-central1-rino-3fbc0.cloudfunctions.net/GetElements');

    if (response.statusCode == 200) {
      String Result = response.body;
      return Result;
    } else {
      return null;
    }
  }
}
