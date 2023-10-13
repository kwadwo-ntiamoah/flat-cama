import 'package:cama_mod/views/shared/webviewBuilder.dart';
import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';

class BibleView extends StatelessWidget {
  const BibleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            backgroundColor: KColors.kPrimaryColor,
            title: const Text('Bible')),
      body: const WebViewBuilder(url: "https://thekingsbible.com/"),
    );
  }
}
