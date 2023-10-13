part of 'item_details.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (ctx, data, _) {
      Item? item = data.selectedItem;

      if (item != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(item.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('GHS ${item.price}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            Row(
              children: <Widget>[
                const Text('Availability: '),
                Text(
                  item.inStock == true ? 'In stock' : 'Out of Stock',
                  style: TextStyle(
                      color: item.inStock == true ? Colors.green : Colors.red),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(item.description),
          ],
        );
      } else {
        return Center(
            child: CircularProgressIndicator(
          color: KColors.kPrimaryColor,
        ));
      }
    });
  }
}
