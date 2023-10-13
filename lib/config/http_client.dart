import 'dart:convert';
import 'dart:io';

import 'package:cama_mod/views/models/api_response/api_response.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyHttpClient {
  Future<ApiResponse> get(String url) async {
    var clientUrl = Uri.parse(url);
    var response = await http.get(clientUrl);

    return ApiResponse.fromJson(json.decode(response.body));
  }

  Future<ApiResponse> post(String url, String jsonPayload) async {
    var clientUrl = Uri.parse(url);
    var response = await http.post(clientUrl, body: jsonPayload);

    return ApiResponse.fromJson(json.decode(response.body));
  }
}

