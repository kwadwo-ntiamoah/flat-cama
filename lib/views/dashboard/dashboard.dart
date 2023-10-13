import 'package:cama_mod/models/bottom_nav_model.dart';
import 'package:cama_mod/views/contact/contact.dart';
import 'package:cama_mod/views/events/events.dart';
import 'package:cama_mod/views/home/home.dart';
import 'package:cama_mod/views/prayer/prayer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/config/colors.dart';


part 'dashboard_bottom_nav.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static List pages = [
    HomeView(scaffoldKey: GlobalKey<ScaffoldState>()),
    const PrayerView(),
    const EventsView(),
    const ContactView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BottomNavModel>(builder: (ctx, data, _) {
        return Scaffold(
          extendBody: true,
          body: pages[data.activeIndex],
          bottomNavigationBar: const DashboardBottomNavbar(),
        );
      }),
    );
  }
}
