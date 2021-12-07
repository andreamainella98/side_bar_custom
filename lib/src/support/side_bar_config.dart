import 'package:flutter/material.dart';
import 'package:side_bar_custom/src/utils/colors.dart';

class SideBarConfig {
  final Color backgroundColor;
  final Color dividerColor;
  final Color selectedBoxColor;
  final Color selectedIconColor;
  final Color selectedTextColor;
  final Color unselectedBoxColor;
  final Color unselectedIconColor;
  final Color unselectedTextColor;
  final bool enableDivider;
  final bool enableFloating;
  final bool enablePageView;
  final bool enableResizeBody;
  final double collapseWidth;
  final double dividerIndent;
  final double dividerThickness;
  final double? fontSize;
  final double maxWidth;
  final BoxDecoration? tooltipDecoration;
  final TextStyle? tooltipTextStyle;
  final BorderRadius borderRadius;
  final Curve sideBarCurve;
  final Duration sideBarAnimationDuration;
  final EdgeInsets floatingPadding;

  SideBarConfig({
    this.backgroundColor = sideBarBackgroundColor,
    this.dividerColor = sideBarDividerColor,
    this.selectedBoxColor = sideBarSelectedBoxColor,
    this.selectedIconColor = sideBarSelectedItemColor,
    this.selectedTextColor = sideBarSelectedItemColor,
    this.unselectedBoxColor = sideBarBackgroundColor,
    this.unselectedIconColor = sideBarUnselectedItemColor,
    this.unselectedTextColor = sideBarUnselectedItemColor,
    this.enableDivider = true,
    this.enableFloating = false,
    this.enablePageView = true,
    this.enableResizeBody = true,
    this.collapseWidth = 60.0,
    this.dividerIndent = 10,
    this.dividerThickness = 0.6,
    this.fontSize,
    this.maxWidth = 260.0,
    this.tooltipDecoration,
    this.tooltipTextStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.sideBarCurve = Curves.ease,
    this.sideBarAnimationDuration = const Duration(milliseconds: 300),
    this.floatingPadding = const EdgeInsets.all(8),
  });
}
