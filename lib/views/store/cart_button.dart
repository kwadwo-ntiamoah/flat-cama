part of 'store.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (ctx) {
            return const Wrap(
              children: [CartDetails()],
            );
          },
        );
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Badge(
            label: Consumer<CartModel>(builder: (ctx, data, _) {
              return Text(data.cartLength.toString());
            }),
            child: const Icon(Icons.shopping_cart_rounded),
          ),
        ),
      ),
    );
  }
}
