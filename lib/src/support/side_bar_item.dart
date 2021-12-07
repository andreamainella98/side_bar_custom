import 'package:flutter/material.dart';

class SideBarItem {
  final String text;
  final String? tooltipText;
  final IconData icon;

  SideBarItem({
    required this.text,
    required this.icon,
    this.tooltipText,
  });
}
