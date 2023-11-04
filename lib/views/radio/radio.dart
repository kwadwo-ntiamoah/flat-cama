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
      backgroundColor: Colors.white,
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
              padding: EdgeInsets.zero,
              color: KColors.kLightColor,
              width: double.infinity,
              child: TabBar(
                unselectedLabelColor: KColors.kDarkColor,
                labelStyle:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: KColors.kTextColorLight),
                padding: EdgeInsets.zero,
                indicator: BoxDecoration(color: KColors.kPrimaryColor),
                indicatorPadding: EdgeInsets.zero,
                tabs: const <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      text: 'Now Playing',
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      text: 'Schedule',
                      height: 50,
                    ),
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
