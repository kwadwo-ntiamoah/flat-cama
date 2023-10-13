import 'package:cama_mod/config/http_client.dart';
import 'package:cama_mod/views/models/day/day.dart';

import '../views/models/api_response/api_response.dart';

class RadioRepo {
  final MyHttpClient client;

  RadioRepo({ required this.client });

  Future<List<Day>> getDays() async {
    try {
      ApiResponse response =
      await client.get("https://10.0.2.2:7145/api/Misc/getDays");

      if (response.status == 200) {
        return (response.data as List).map((e) => Day.fromJson(e)).toList();
      } else {
        throw Exception(response.message);
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}