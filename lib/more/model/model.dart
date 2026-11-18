import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({
    required this.title,
    required this.icon,
    this.subtitle,
    this.color,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? color;
  final void Function()? onTap;
}
