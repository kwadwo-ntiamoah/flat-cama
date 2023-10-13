import 'package:flutter/cupertino.dart';

class MenuButton {
  final String title;
  final String? image;
  final IconData? icon;
  final String route;
  final bool isImage;

  const MenuButton({
    required this.title,
    required this.route,
    this.icon,
    this.image,
    this.isImage = true,
  });
}
