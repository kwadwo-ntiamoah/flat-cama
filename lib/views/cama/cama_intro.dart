import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/views/shared/webviewBuilder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/colors.dart';
import '../shared/KButton.dart';

class CamaIntroView extends StatelessWidget {
  const CamaIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: KColors.kPrimaryColor,
          automaticallyImplyLeading: true,
          elevation: 0,
          title: const Text('CAMA'),
        ),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Text(
                  "WELCOME TO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                SizedBox(height: 5),
                Text("Chris Asante Ministerial",
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Text(
                  "Association",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                KButton(
                  onPressed: () {
                    context.pushNamed("cama_join");
                  },
                  label: "Join Now",
                  color: KColors.kPrimaryColor,
                  showIcon: false,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset(Assets.images1),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("BUILDING GODLY LEADERS",
                          style: TextStyle(color: Colors.white)),
                      Text("TO DOMINATE THE WORLD",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 30),
              child: Column(
                children: [
                  Text(
                    "COVENANT LETTER",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Text("Ephesians 4:11-13"),
                  Text("This is the church's finest hour"),
                  const SizedBox(height: 25),
                  Text("Dear Covenant friend, "),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                "I believe that this is the church’s finest hour. "
                "Today is the day that the body of Christ has longed "
                "to see. God’s power is being poured out. His Spirit "
                "is moving. The vast fields of this world are ripe for "
                "harvest. Our time to shine has&nbsp;come.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(
                  "For some time, the Lord has been speaking to my heart "
                  "about organizing an Association of churches and "
                  "ministries for training, edification, and fellowship",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text(
                  "A place where Christian leaders will be empowered and "
                  "equipped with the spiritual and physical tools they need "
                  "to advance the kingdom of God. An organization that "
                  "would inspire its members to grow and attain the highest "
                  "levels of excellence, integrity, and influence",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text(
                  "Out of this union of like-minded individuals, we will "
                      "multiply our effectiveness as we arise in corporate "
                      "faith to impact nations in a much greater way than one "
                      "church or ministry could do alone.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text(
                  "Through resource sharing and the corporate anointing, I see "
                      "the Church moving into a place of power and influence "
                      "not seen since the time in the book of Acts. Uniting "
                      "under one banner, having a primary focus to gather in "
                      "the end time harvest of souls and the end takeover of "
                      "this world’s wealth",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text(
                  "No more low budget Christian television shows, no longer a "
                      "shortage of funds to start a new building project, no "
                      "more delays in sending out missionaries due to lack of "
                      "financial support. We are coming together, no longer "
                      "taking sides, but taking over.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text(
                  "If you feel God’s leading to be a part of an association "
                      "that I believe will play a significant role in ushering "
                      "in the return of our Lord Jesus Christ, I encourage you "
                      "to complete the attached forms and submit your application.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Text("In His Service", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              KButton(onPressed: (){
                context.pushNamed("cama_join");
              }, label: "Join Now", color: KColors.kPrimaryColor, showIcon: false),
              SizedBox(height: 20)
            ]),
          )
        ]));
  }
}
