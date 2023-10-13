import 'package:cached_network_image/cached_network_image.dart';
import 'package:cama_mod/views/models/Item/item.dart';
import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:go_router/go_router.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CachedNetworkImage(
                  imageUrl: item.thumbnail,
                  placeholder: (BuildContext context, String url) {
                    return const Icon(Icons.shopping_cart, size: 30);
                  },
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .3),
            ),
            Column(
              children: [
                Text(item.category.name, style: const TextStyle(fontSize: 12)),
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 25),
                TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: KColors.kPrimaryColor),
                    onPressed: () => context.pushNamed("item", extra: item),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                        child: Text('Buy Now',
                            style: TextStyle(color: Colors.white))))
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
