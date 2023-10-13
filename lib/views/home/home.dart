import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/views/models/menu_button.dart';
import 'package:cama_mod/views/shared/FadeSlideShow.dart';
import 'package:cama_mod/views/shared/KDrawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cama_mod/config/colors.dart';

part 'home_menu.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeView({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      backgroundColor: KColors.kLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Assets.imagesLogo, height: 40,),
            IconButton(
              color: KColors.kDarkColor,
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                if (scaffoldKey.currentState != null) {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            )
          ],
        ),
      ),
      body: const Stack(
        children: [
          FadeSlideShow(),
          HomeMenu()
        ],
      ),
      drawer: const KDrawer(),
    );
  }
}
