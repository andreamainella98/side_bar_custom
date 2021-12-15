import 'package:flutter/material.dart';

class SideBarItem {
  /// This value used for set text of SideBarItem.
  final String text;

  /// This value used for set tooltip text of SideBarItem,
  /// if setted the tooltip show up.
  final String? tooltipText;

  /// This value used for set icon of SideBarItem.
  final IconData icon;

  SideBarItem({
    required this.text,
    required this.icon,
    this.tooltipText,
  });
}
