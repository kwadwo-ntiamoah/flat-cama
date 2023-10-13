import 'package:cama_mod/config/service_locator.dart';
import 'package:cama_mod/models/bottom_nav_model.dart';
import 'package:cama_mod/models/cart_model.dart';
import 'package:cama_mod/models/fade_slide_model.dart';
import 'package:cama_mod/models/radio_model.dart';
import 'package:cama_mod/models/store_model.dart';
import 'package:cama_mod/models/tv_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_model.dart';
import 'counter_model.dart';

class AppNotificationProvider extends StatelessWidget {
  final MaterialApp child;

  const AppNotificationProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(create: (ctx) => CounterModel()),
        ChangeNotifierProvider<BottomNavModel>(create: (ctx) => BottomNavModel()),
        ChangeNotifierProvider<FadeSlideModel>(create: (ctx) => FadeSlideModel()),
        ChangeNotifierProvider<ContactModel>(create: (ctx) => ContactModel()),
        ChangeNotifierProvider<StoreModel>(create: (ctx) => StoreModel(shopRepo: getIt())),
        ChangeNotifierProvider<CartModel>(create: (ctx) => CartModel()),
        ChangeNotifierProvider<RadioModel>(create: (ctx) => RadioModel(radioRepo: getIt())),
        ChangeNotifierProvider<TvModel>(create: (ctx) => TvModel()),
      ],
      child: child,
    );
  }
}
