import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/views/testimony/testimony_form.dart';
import 'package:flutter/material.dart';

class TestimonyView extends StatelessWidget {
  const TestimonyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Testimony", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: KColors.kPrimaryColor,
      ),
      body: const TestimonyForm(),
    );
  }
}
