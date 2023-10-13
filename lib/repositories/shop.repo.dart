import 'package:cama_mod/config/http_client.dart';
import 'package:cama_mod/views/models/Item/item.dart';

import '../views/models/api_response/api_response.dart';

class ShopRepo {
  final MyHttpClient client;

  ShopRepo({ required this.client });

  Future<List<Item>> getShopItems() async {
    try {
      ApiResponse response =
      await client.get("https://10.0.2.2:7145/api/Shop/items");

      if (response.status == 200) {
        return (response.data as List).map((e) => Item.fromJson(e)).toList();
      } else {
        throw Exception(response.message);
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}