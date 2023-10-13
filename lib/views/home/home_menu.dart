part of 'home.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  static List<List<MenuButton>> menus = [
    [
      const MenuButton(title: "CAM TV", image: Assets.iconsTv, route: "tv"),
      const MenuButton(title: "iRadio", image: Assets.iconsRadio, route: "radio"),
      const MenuButton(
          title: "Partner", image: Assets.iconsPartner, route: "partner")
    ],
    [
      const MenuButton(title: "Give", image: Assets.iconsGive2, route: "give"),
      const MenuButton(
          title: "eStore",
          icon: Icons.shopping_cart_rounded,
          route: "store",
          isImage: false),
      const MenuButton(
          title: "Bible",
          icon: Icons.menu_book_rounded,
          route: "bible",
          isImage: false)
    ],
    [
      const MenuButton(
          title: "CAMA",
          icon: Icons.group_add_rounded,
          route: "cama",
          isImage: false),
      const MenuButton(
          title: "Archives", image: Assets.iconsArchives, route: "archives"),
      const MenuButton(title: "Social", image: Assets.iconsAllSocial, route: "social")
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * .12,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .45,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(3, (index) => _menuCard(context, 0, index)),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                List.generate(3, (index) => _menuCard(context, 1, index)),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                List.generate(3, (index) => _menuCard(context, 2, index)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, int parentIndex, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: KColors.kPrimaryColor,
                  backgroundColor: KColors.kLightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  menus[parentIndex][index].isImage
                      ? Image.asset(menus[parentIndex][index].image!, width: 32.5, height: 32.5,)
                      : Icon(
                          menus[parentIndex][index].icon,
                          color: KColors.kPrimaryColor,
                          size: 35,
                        ),
                  Text(
                    menus[parentIndex][index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: KColors.kDarkColor),
                  )
                ],
              ),
              onPressed: () =>
                  context.pushNamed(menus[parentIndex][index].route)),
        ),
      ),
    );
  }
}
