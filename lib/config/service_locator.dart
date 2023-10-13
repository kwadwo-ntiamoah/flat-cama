import 'dart:io';

import 'package:cama_mod/config/http_client.dart';
import 'package:cama_mod/repositories/radio.repo.dart';
import 'package:cama_mod/repositories/shop.repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MyHttpClient>(MyHttpClient());
  getIt.registerSingleton<ShopRepo>(ShopRepo(client: getIt()));
  getIt.registerSingleton<RadioRepo>(RadioRepo(client: getIt()));
}
