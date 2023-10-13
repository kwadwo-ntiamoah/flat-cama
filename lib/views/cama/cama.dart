import 'package:cama_mod/views/shared/webviewBuilder.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CamaView extends StatelessWidget {
  const CamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('CAMA'),
      ),
      body: const WebViewBuilder(url: "https://a399-41-155-4-147.ngrok-free.app/cama"),
    );
  }
}
