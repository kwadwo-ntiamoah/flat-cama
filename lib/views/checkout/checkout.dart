import 'package:cama_mod/models/store_model.dart';
import 'package:cama_mod/views/shared/KFormField.dart';
import 'package:cama_mod/views/store/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../models/cart_model.dart';
import '../shared/KButton.dart';

part 'checkout_form.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Info", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: KColors.kPrimaryColor,
      ),
      body: Consumer<CartModel>(builder: (ctx, data, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: data.cartItems
                      .map((e) => CartDetailsCard(cartItem: e, smallIcon: true))
                      .toList(),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Please enter Shipping/Billing Info',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const CheckoutForm()
              ],
            ),
          ),
        );
      }),
    );
  }
}
