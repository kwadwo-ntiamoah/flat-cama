import "dart:ffi";

import "package:cama_mod/generated/assets.dart";
import "package:cama_mod/views/shared/KButton.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../config/colors.dart";

class CamaJoin extends StatelessWidget {
  const CamaJoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('CAMA'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(Assets.imagesPeoplePray),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "Join the Family",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed("cama_subscription");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Text(
                          "BECOME A MEMBER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: Column(
                    children: [
                      Text(
                        "UNDERSTANDING GRACE",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "EMPOWERING CHANGE",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(height: 30),
          Text("It's a fellowship",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "PAMA is not a denomination. It is a fellowship. We are composed "
              "of many denominations, desiring primarily to grow in covenant "
              "with one another. Therefore, each ministry participates under the"
              " directions of God, with the goal of being a blessing to all "
              "families on the earth. ",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "(Genesis 12:1-3)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("There are no governing bodies to report to or fear. "
                "There are no investigations or disciplinary actions to "
                "consider. PAMA is not interested in overseeing a church or "
                "outreach ministry. Each ministry must stand before God on it's "
                "own. Our goal is to complement your assignment by making our "
                "expertise available to you. We take a more active role only "
                "by request"),
          ),
          SizedBox(height: 30),
          HowToBeAMember()
        ],
      ),
    );
  }
}

class HowToBeAMember extends StatelessWidget {
  const HowToBeAMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0XFF9ca3af),
      child: Column(
        children: [
          Text(
            "How to become a member",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Text(
            "Joining PAMA is easy. Our goal is to serve you by helping to "
            "maximize the vision of your ministry. Below is a list of "
            "requirements to join this dynamic organization",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Divider(
              color: Colors.black,
              thickness: 5,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Please ensure you have the below items ready before applying online",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          ListOfNeededItems(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: KButton(
              onPressed: () {
                context.pushNamed("cama_subscription");
              },
              label: "APPLY NOW",
              color: KColors.kPrimaryColor,
              showIcon: false,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ListOfNeededItems extends StatelessWidget {
  const ListOfNeededItems({super.key});

  static final List<String> items = [
    "HISTORY OF LEADERS AND MINISTRY'S GROWTH",
    "MINISTRY VISION",
    "STATEMENT OF BELIEFS",
    "COPY OF MINISTRY LICENSE/ORDINATION CERTIFICATE",
    "LETTER OF RECOMMENDATION FROM A COLLEAGUE IN MINISTRY",
    "PHOTO OF MINISTRY LEADER",
    "ARTICLES OF INCORPORATION AND BYLWAYS",
    "ANNUAL MEMBERSHIP FEE OF GHS 250.00"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((element) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "\u2022 $element",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        );
      }).toList(),
    );
  }
}
