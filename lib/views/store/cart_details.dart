import 'package:cached_network_image/cached_network_image.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/models/cart_model.dart';
import 'package:cama_mod/views/models/cart.dart';
import 'package:cama_mod/views/shared/KButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CartModel>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).size.height * .85,
        child: data.cartLength > 0
            ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, i) {
                        return CartDetailsCard(
                          cartItem: data.cartItems[i],
                        );
                      },
                      itemCount: data.cartLength,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: KButton(
                      showIcon: false,
                      onPressed: () => context.pushNamed("checkout"),
                      label: "Checkout | GHS ${data.cartTotalAmount}",
                    ),
                  )
                ],
              )
            : const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_checkout_rounded,
                    color: Colors.grey, size: 90),
                SizedBox(height: 10),
                Text("No Items added to cart")
              ],
            ));
  }
}

class CartDetailsCard extends StatelessWidget {
  const CartDetailsCard({super.key, required this.cartItem, this.smallIcon});

  final CartItem cartItem;
  final bool? smallIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: cartItem.item.thumbnail,
              height: smallIcon == true ? 80 : 150,
              width: smallIcon == true ? 80 : 150,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.item.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("GHS ${cartItem.item.price} x ${cartItem.quantity}")
              ],
            )
          ],
        )),
        Consumer<CartModel>(builder: (ctx, data, _) {
          return IconButton(
            onPressed: () => data.removeFromCart(cartItem.item.id),
            icon: Icon(
              Icons.delete,
              color: KColors.kPrimaryColor,
            ),
          );
        })
      ],
    );
  }
}
