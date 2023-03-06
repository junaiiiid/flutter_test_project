// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test_project/constants/string_constants.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:flutter_test_project/models/api_model.dart';

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
      throw Exception(StringConstants.apiErrorMessage);
    }
  }
}
