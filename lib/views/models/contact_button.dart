import 'package:flutter/cupertino.dart';

class ContactButton {
  final String title;
  final String? image;
  final IconData? icon;
  final String target;
  final bool isImage;

  const ContactButton({
    required this.title,
    required this.target,
    this.icon,
    this.image,
    this.isImage = true,
  });
}
