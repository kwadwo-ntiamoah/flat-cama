import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';

part 'event_upcoming.dart';
part 'event_past.dart';
part 'event_live.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            foregroundColor: Colors.white,
            backgroundColor: KColors.kPrimaryColor,
            title: const Text(
              'EVENTS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          bottom: const TabBar(tabs: [
            Tab(text: "UPCOMING"),
            Tab(text: "PAST"),
            Tab(text: "LIVE"),
          ]),
        ),
        body: const TabBarView(
          children: [
            EventUpcoming(),
            EventPast(),
            EventLive()
          ],
        ),
      ));
  }
}
