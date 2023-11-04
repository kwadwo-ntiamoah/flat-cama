import 'package:better_player/better_player.dart';
import 'package:cama_mod/models/tv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../generated/assets.dart';
import 'countdown.dart';

part 'date_section.dart';
part 'coga_tv.dart';
part 'player.dart';
part 'donate.dart';

class TvView extends StatelessWidget {
  const TvView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.kLightColor,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: KColors.kLightColor),
        iconTheme: IconThemeData(color: KColors.kDarkColor),
        automaticallyImplyLeading: true,
        toolbarHeight: 40,
        backgroundColor: KColors.kLightColor,
        title: Row(
          children: [
            Text(
              'BROADCAST',
              style: TextStyle(
                  color: KColors.kDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DateSection(),
            const CogaTV(),
            const TvPlayer(),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            _nextLiveEvent,
            _comingUp,
            const SizedBox(height: 8),
            _watchUs,
            const SizedBox(height: 8),
            _connectWithUs,
            _support,
            SizedBox(height: MediaQuery.of(context).size.height * .1)
          ],
        ),
      ),
    );
  }

  Widget get _nextLiveEvent {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(.2)),
            bottom: BorderSide(color: Colors.grey.withOpacity(.2)),
            left: BorderSide(
                color: Colors.deepPurpleAccent.withOpacity(.5), width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Next Live Service',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.deepPurpleAccent.withOpacity(.5))),
          Icon(Icons.notifications,
              size: 22, color: Colors.deepPurpleAccent.withOpacity(.5))
          // Icon(Icons.satellite_alt_rounded, size: 20, color: KColors.kPrimaryColor,)
        ],
      ),
    );
  }

  Widget get _comingUp {
    return Consumer<TvModel>(builder: (ctx, state, _) {
      return Builder(builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.black54,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Consumer<TvModel>(builder: (ctx, state, _) {
                          return Text(DateFormat('EEEE, d MMMM, yyyy')
                              .format(state.getNextSunday()));
                        })
                      ],
                    ),
                    const Text('11:00 AM')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text('Sunday Morning Service',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KColors.kDarkColor)),
              ),
              const SizedBox(height: 25),
              CountdownTimer(
                fullDuration: state.timeDuration(),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.notifications, color: KColors.kPrimaryColor),
                        const SizedBox(width: 10),
                        const Text('Remind')
                      ],
                    ),
                    Row(
                      children: [
                        Visibility(
                            visible: state.remind,
                            child: Text(
                                "${DateFormat('d MMM, 11:00 ').format(state.getNextSunday())}AM",
                                style: const TextStyle(fontSize: 12))),
                        const SizedBox(width: 2),
                        Switch(
                            value: state.remind,
                            onChanged: (value) => state.setReminder(value),
                            activeColor: Colors.white,
                            activeTrackColor: KColors.kPrimaryColor)
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: KColors.kPrimaryColor),
                        const SizedBox(width: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Add To Calendar'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.share_rounded, color: KColors.kPrimaryColor),
                          const SizedBox(width: 10),
                          const Text('Share')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
    });
  }

  Widget get _watchUs {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          )
        ]),
        child: Image.asset(Assets.imagesWatchUs));
  }

  Widget get _connectWithUs {
    List<Map<String, String>> socialLinks = [
      {
        'title': 'Facebook',
        'image': Assets.imagesFacebook,
        'link': 'https://facebook.com/prophetasantemensah'
      },
      {
        'title': 'Twitter',
        'image': Assets.imagesTwitter,
        'link': 'https://twitter.com/revasantemensah'
      },
      {
        'title': 'Tiktok',
        'image': Assets.imagesTikTok,
        'link': 'https://www.tiktok.com/@chrisasanteministries'
      },
      {
        'title': 'Youtube',
        'image': Assets.imagesYoutube,
        'link': 'https://www.youtube.com/channel/UCCawkgDRQGkkuOq9iMq75XQ'
      },
      {
        'title': 'Instagram',
        'image': Assets.imagesInstagram,
        'link': 'https://www.instagram.com/prophetasantemensah/'
      }
    ];

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              )
            ]),
        child: Column(
          children: [
            const Text(
              'Connect with us',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            Consumer<TvModel>(builder: (ctx, state, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: socialLinks
                    .map((e) => GestureDetector(
                        onTap: () =>
                            state.launchInBrowser(Uri.parse(e['link']!)),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          child: Image.asset(
                            e['image']!,
                          ),
                        )))
                    .toList(),
              );
            })
          ],
        ));
  }

  Widget get _support {
    return Builder(builder: (context) {
      return Stack(
        children: [
          supportText,
          SizedBox(
            height: MediaQuery.of(context).size.height * .22,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .42,
            bottom: 0,
            child: const Donate(),
          )
        ],
      );
    });
  }

  Widget get supportText {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              )
            ]),
        child: const Column(
          children: [
            Text(
              "Please Support",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Chris Asante",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
