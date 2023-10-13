import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';

class ArchivesView extends StatelessWidget {
  const ArchivesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            backgroundColor: KColors.kPrimaryColor,
            title: const Text('Archives'))
    );
  }
}
