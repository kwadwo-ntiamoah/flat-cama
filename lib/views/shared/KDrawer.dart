import 'package:cama_mod/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/menu_button.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  static List<MenuButton> menuItems = [
    const MenuButton(title: "About Us", route: "about", icon: Icons.info_outline_rounded),
    const MenuButton(title: "Give Online", route: "give", icon: Icons.favorite_outline_rounded),
    const MenuButton(title: "Share Testimony", route: "testimony", icon: Icons.message_outlined),
    const MenuButton(title: "Contact Us", route: "contact", icon: Icons.mail_outline_rounded),
    const MenuButton(title: "Social Media", route: "social", icon: Icons.alternate_email_outlined),
    const MenuButton(title: "Prayer Request", route: "prayer", icon: Icons.rate_review_outlined),
    const MenuButton(title: "Visit Website", route: "website", icon: Icons.tv_rounded),
    const MenuButton(title: "Share App", route: "share", icon: Icons.share_rounded),
    const MenuButton(title: "Events", route: "events", icon: Icons.event_available_outlined)
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: KColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                enableFeedback: true,
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                  context.pushNamed(menuItems[index].route);
                },
                leading: Icon(
                  menuItems[index].icon,
                  color: Colors.white,
                ),
                title: Text(
                  menuItems[index].title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              );
            }),
      ),
    );
  }
}

Widget openDrawer(Color color) {
  return Builder(
    builder: (BuildContext context) {
      return InkWell(
        enableFeedback: true,
        child: Icon(
          Icons.menu,
          color: color,
          size: 30,
        ),
        onTap: () => Scaffold.of(context).openDrawer(),
      );
    },
  );
}
