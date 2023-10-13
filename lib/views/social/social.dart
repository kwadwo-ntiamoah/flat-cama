import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/models/contact_model.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/views/models/social_button.dart';
import 'package:cama_mod/views/models/social_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'social_contact.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('Social'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 56,
              width: double.infinity,
              color: KColors.kLightColor,
              child: const Text('Follow Chris Asante Ministries on'),
            ),
            const ContactSocial(),
            const SizedBox(height: 20),
            const Text('Share CAM on',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.iconsFaceBlack, height: 30),
                const SizedBox(width: 30),
                Image.asset(Assets.iconsTweetBlack, height: 30),
                const SizedBox(width: 30),
                const Icon(
                  Icons.share,
                  size: 30,
                )
              ],
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
