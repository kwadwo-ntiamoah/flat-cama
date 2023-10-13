part of 'dashboard.dart';

class DashboardBottomNavbar extends StatelessWidget {
  const DashboardBottomNavbar({super.key});

  static const List menuItems = [
    {'title': 'Home', 'icon': FontAwesomeIcons.house, 'type': 'icon'},
    {'title': 'Prayer', 'icon': Assets.iconsPrayNoline, 'type': 'image'},
    {'title': 'Events', 'icon': Assets.iconsEventLarge, 'type': 'image'},
    {'title': 'Contact', 'icon': Assets.iconsCallUsLarge, 'type': 'image'},
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) => context.read<BottomNavModel>().setActiveIndex(index),
      animationDuration: const Duration(milliseconds: 250),
      height: 60,
      animationCurve: Curves.easeInOut,
      backgroundColor: Colors.transparent,
      color: KColors.kLightColor,
      buttonBackgroundColor: KColors.kPrimaryColor,
      items: List.generate(
          4, (index) => iconBuilder(menuItems[index], index)),
    );
  }

  Widget iconBuilder(item, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<BottomNavModel>(builder: (ctx, data, _) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: index == data.activeIndex ? 0 : 18.0, bottom: 2),
              child: item['type'] == 'icon'
                  ? FaIcon(item['icon'], size: 21.5, color: data.activeIndex == index ? Colors.white : Colors.black87.withOpacity(.8))
                  : Image.asset(item['icon'], color: data.activeIndex == index ? Colors.white : Colors.black87.withOpacity(.8), height: 22.5),
            ),
            index == data.activeIndex
                ? const SizedBox.shrink()
                : Text(
              item['title'].toString().toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w900),
            )
          ],
        );
      })
    );
  }
}
