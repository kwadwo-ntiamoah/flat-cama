import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/models/radio_model.dart';
import 'package:cama_mod/views/radio/player_buffer.dart';
import 'package:cama_mod/views/radio/radial_volume.dart';
import 'package:cama_mod/views/shared/Support.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

part 'now_playing.dart';
part 'schedule.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          foregroundColor: KColors.kDarkColor,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(Assets.imagesCogaRadio, height: 80)),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: KColors.kLightColor.withOpacity(.6),
              child: TabBar(
                unselectedLabelColor: KColors.kDarkColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(color: KColors.kPrimaryColor),
                tabs: const <Widget>[
                  Tab(
                    text: 'Now Playing',
                    height: 50,
                  ),
                  Tab(
                    text: 'Schedule',
                    height: 50,
                  )
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  NowPlaying(),
                  Schedule(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
