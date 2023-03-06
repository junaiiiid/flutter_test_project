import 'dart:convert';
import 'package:flutter_test_project/models/api_model.dart';
import 'package:http/http.dart' as http;

class NetworkService{

  NetworkService._();

  static const String apiUrl = 'https://us-central1-fir-apps-services.cloudfunctions.net/transactions';

  static Future<ApiModel> fetchData() async {
    final response = await http
        .get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ApiModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}