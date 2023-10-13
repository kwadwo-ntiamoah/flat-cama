import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/models/contact_model.dart';
import 'package:cama_mod/views/models/contact_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cama_mod/config/colors.dart';

part 'contact_social.dart';
part 'contact_map.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 56,
              width: double.infinity,
              color: KColors.kLightColor,
              child: const Text('Choose an option'),
            ),
            const ContactSocial(),
            const ContactMap(),
            SizedBox(height: MediaQuery.of(context).size.height * .15)
          ],
        ),
      ),
    );
  }
}
