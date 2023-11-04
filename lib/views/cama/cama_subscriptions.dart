import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/views/shared/KButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CamaSubscriptions extends StatelessWidget {
  const CamaSubscriptions({super.key});

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
          Padding(
            padding: const EdgeInsets.only(
                top: 24.0, bottom: 10, left: 56, right: 56),
            child: Container(
              padding: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: KColors.kPrimaryColor, width: 3))),
              child: Text(
                "SUBSCRIPTION PLAN",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          Column(
            children: [1, 2, 3].map((element) {
              return SubscriptionCard();
            }).toList(),
          )
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 56, right: 56, top: 18),
          child: Container(
            height: 400,
            padding: EdgeInsets.all(8),
            color: Color(0xff434a53),
          ),
        ),
        Positioned(
            top: 45,
            left: 0,
            right: 9,
            child: Text(
              "Free",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Positioned(
          top: 70,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Sign Up Now",
                style: TextStyle(
                    color: Color(0xff434a53),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              height: 70,
              width: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff434a53), width: 3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0, right: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text("Free level allowing limited access to most of our content", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: KButton(onPressed: (){
                  context.pushNamed("cama_apply");
                }, label: "SIGN UP", showIcon: false, color: KColors.kPrimaryColor,),
              )
            ],
          ),
        )
      ],
    );
  }
}
