import 'package:cama_mod/models/cart_model.dart';
import 'package:cama_mod/models/store_model.dart';
import 'package:cama_mod/views/store/cart_details.dart';
import 'package:cama_mod/views/store/item_card.dart';
import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:provider/provider.dart';

part 'cart_button.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  void initState() {
    getShopItems();
    super.initState();
  }

  Future getShopItems() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var storeModel = context.read<StoreModel>();
      await storeModel.getShopItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (ctx, data, _) {
      return Scaffold(
          backgroundColor: KColors.kLightColor,
          appBar: AppBar(
            backgroundColor: KColors.kPrimaryColor,
            automaticallyImplyLeading: true,
            elevation: 0,
            title: const Text('Store'),
            actions: const [CartButton()],
          ),
          body: data.isLoading
              ? Center(
                  child:
                      CircularProgressIndicator(color: KColors.kPrimaryColor))
              : Container(
                  decoration: BoxDecoration(color: KColors.kTextColorDark),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.items.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ItemCard(item: data.items[i]);
                            }),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ));
    });
  }
}
