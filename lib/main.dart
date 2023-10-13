import 'dart:io';

import 'package:cama_mod/config/service_locator.dart';
import 'package:cama_mod/config/themeConfig.dart';
import 'package:cama_mod/models/notification_provider.dart';
import 'package:cama_mod/config/router.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/http_client.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppNotificationProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(KTextTheme.textTheme),
          inputDecorationTheme: TextFieldTheme.textFieldTheme,
          primaryColor: KColors.kPrimaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: KColors.kLightColor,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
