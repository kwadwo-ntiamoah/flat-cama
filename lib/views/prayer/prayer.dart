import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/views/prayer/prayer_form.dart';
import 'package:flutter/material.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Prayer", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: KColors.kPrimaryColor,
      ),
      body: const PrayerForm(),
    );
  }
}
