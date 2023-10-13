part of 'item_details.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ActiveImage(),
        SizedBox(height: 10),
        ImageThumbnails(),
      ],
    );
  }
}

class ActiveImage extends StatelessWidget {
  const ActiveImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (ctx, data, _) {
      if (data.activeImage != null) {
        return CachedNetworkImage(
          imageUrl: data.activeImage!,
          placeholder: (BuildContext context, String url) {
            return const Icon(Icons.shopping_cart, size: 30);
          },
          height: MediaQuery.of(context).size.height * .35,
          fit: BoxFit.cover,
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class ImageThumbnails extends StatelessWidget {
  const ImageThumbnails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (ctx, data, _) {
      if (data.selectedItem != null) {
        List<String> images = data.selectedItem!.images;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((url) {
            return Opacity(
              opacity: url == data.activeImage ? 1 : .2,
              child: GestureDetector(
                  onTap: () => data.setActiveImage(url),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(2),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(3)),
                    child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (BuildContext context, String url) {
                          return const Icon(Icons.shopping_cart, size: 30);
                        },
                        fit: BoxFit.cover),
                  )),
            );
          }).toList(),
        );
      }

      return Center(
          child: CircularProgressIndicator(
        color: KColors.kPrimaryColor,
      ));
    });
  }
}
