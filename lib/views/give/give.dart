import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/views/shared/KButton.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class GiveView extends StatelessWidget {
  const GiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: KColors.kPrimaryColor,
          automaticallyImplyLeading: true,
          elevation: 0,
          title: const Text('Give'),
        ),
        body: ListView(
          children: [
            Image.asset(Assets.imagesGive),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 100, top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Donation Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 24),
                  _formFieldBuilder(text: "Tithe"),
                  const SizedBox(height: 12),
                  _formFieldBuilder(text: "Offerings"),
                  const SizedBox(height: 12),
                  _formFieldBuilder(text: "Firstfruit"),
                  const SizedBox(height: 12),
                  _formFieldBuilder(text: "Seed"),
                  const SizedBox(height: 12),
                  _formFieldBuilder(text: "Total"),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Payment method"),
                      const SizedBox(width: 10),
                      Image.asset(Assets.imagesMtn, height: 30, width: 30,),
                      const SizedBox(width: 4),
                      Image.asset(Assets.imagesVoda, height: 30, width: 30,),
                      const SizedBox(width: 4),
                      Image.asset(Assets.imagesAirtigo, height: 30, width: 30,),
                      const SizedBox(width: 4),
                      Image.asset(Assets.imagesTigo, height: 30, width: 30),
                    ],
                  ),
                  const SizedBox(height: 40),
                  KButton(onPressed: (){}, color: KColors.kPrimaryColor, label: "NEXT"),
                  const SizedBox(height: 25)
                ],
              ),
            )
          ],
        ));
  }

  Widget _formFieldBuilder({ required String text }) {
    return Builder(builder: (context) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            _customFormField(),
          ]
      );
    });
  }

  Widget _customFormField() {
   return Builder(builder: (context) {
     return SizedBox(
       width: 150,
       child: TextFormField(
         style: const TextStyle(fontSize: 24),
         keyboardType: TextInputType.number,
         decoration: InputDecoration(
           hintText: "0.00",
             prefixIcon: Container(
               width: 50,
               height: 56,
               margin: const EdgeInsets.only(right: 10),
               alignment: Alignment.center,
               decoration: BoxDecoration(
                   border: Border(right: BorderSide(color: KColors.kTextColorLight)),
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
               ),
               child: const Text("GHS", style: TextStyle(fontSize: 12)),
             ),
             isDense: true,
             border: OutlineInputBorder(
                 borderSide: BorderSide(color: KColors.kLightColor),
                 borderRadius: BorderRadius.circular(8)
             )
         ),
       ),
     );
   });
  }
}

