part of 'item_details.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final TextEditingController _qtyController = TextEditingController(text: "0");

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 70,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _qtyController,
              keyboardType: TextInputType.number,
            )),
        const SizedBox(width: 10),
        SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width * .35,
          child:
              Consumer2<StoreModel, CartModel>(builder: (ctx, store, cart, _) {
            return TextButton(
                onPressed: () {
                  if (int.parse(_qtyController.value.text) > 0) {
                    cart.addToCart(store.selectedItem!,
                        int.parse(_qtyController.value.text));
                    context.pop();
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor: KColors.kPrimaryColor),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ));
          }),
        )
      ],
    );
  }
}
