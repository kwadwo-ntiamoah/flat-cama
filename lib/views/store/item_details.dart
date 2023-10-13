import 'package:cached_network_image/cached_network_image.dart';
import 'package:cama_mod/models/cart_model.dart';
import 'package:cama_mod/models/store_model.dart';
import 'package:cama_mod/views/models/Item/item.dart';
import 'package:cama_mod/views/store/store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

part 'item_image_gallery.dart';
part 'product_details.dart';
part 'add_to_cart.dart';

class ItemDetailsView extends StatefulWidget {
  final Item item;

  const ItemDetailsView({super.key, required this.item});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  @override
  void initState() {
    setSelectedItem();
    super.initState();
  }

  void setSelectedItem() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var model = context.read<StoreModel>();
      model.setSelectedItem(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.kLightColor,
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('Details'),
        actions: const [CartButton()],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              ImageGallery(),
              ProductDetails(),
              SizedBox(height: 20),
              AddToCart()
            ],
          ),
        ),
      ),
    );
  }
}
