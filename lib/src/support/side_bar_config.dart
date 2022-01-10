import 'package:flutter/material.dart';
import 'package:side_bar_custom/src/utils/colors.dart';

class SideBarConfig {
  /// This color is used to change the background color of the SideBar.
  /// default value = Color(0xff303F9F)
  final Color backgroundColor;

  /// This color is used to change the color of bottom icon of the SideBar.
  /// default value = Color(0xff448AFF)
  final Color bottomIconColor;

  /// This color is used to change the color of divider of SideBar.
  /// default value = Color(0xff448AFF)
  final Color dividerColor;

  /// This color is used to change the background of the single selected item.
  /// default value = Color(0xff3F51B5)
  final Color selectedBoxColor;

  /// This color is used to change the color of icon of the single selected item.
  /// default value = Color(0xffC5CAE9)
  final Color selectedIconColor;

  /// This color is used to change the background of the single unselected item.
  /// default value = Color(0xff303F9F)
  final Color unselectedBoxColor;

  /// This color is used to change the color of icon of the single selected item.
  /// default value = Color(0xff448AFF)
  final Color unselectedIconColor;

  /// This value is used to enable the SideBar divider.
  /// default value = true
  final bool enableDivider;

  /// This value is used to enable the SideBar to become floating.
  /// default value = false
  final bool enableFloating;

  /// This value is used to enable the animation to the children of SideBar.
  /// default value = true
  final bool enablePageView;

  /// This value is used to enable the resize of the SideBar body,
  /// if set to false the children in the body will have a fixed size.
  /// default value = true
  final bool enableResizeBody;

  /// This value determines the width of the SideBar when it is collapsed.
  /// default value = 60.0
  final double collapseWidth;

  /// This value is used to determine the spacing of the divider in the left and right edges.
  /// default value = 10
  final double dividerIndent;

  /// This value is used to determine the thickness of the Divider inside the SideBar.
  /// default value = 0.6
  final double dividerThickness;

  /// This optional value is used to set the size of the SideBarItem font.
  final double? fontSize;

  /// This optional value is used to set the size of the SideBarItem icon.
  final double? iconSize;

  /// This value determines the width of the SideBar when it is not collapsed.
  /// default value = 260.0
  final double maxWidth;

  /// This value is used to set a style for Tooltips when they are enabled.
  final BoxDecoration? tooltipDecoration;

  /// This value is used to set a style for Text inside Tooltips when they are enabled.
  final TextStyle? tooltipTextStyle;

  /// This value is used to set a style for Text inside SideBarItem when it is selected.
  final TextStyle selectedTextStyle;

  /// This value is used to set a style for Text inside SideBarItem when it is unselected.
  final TextStyle unselectedTextStyle;

  /// This value is used when [enableFloating] is set to true and is used to set a
  /// radius at the edges of the SideBar.
  /// default value = BorderRadius.all(Radius.circular(6))
  final BorderRadius borderRadius;

  /// This value is used to indicate an animation curve for all SideBar animations.
  /// default value = [Curves.ease]
  final Curve sideBarCurve;

  /// This value is used to indicate a duration for all SideBar animations.
  /// default value = Duration(milliseconds: 300)
  final Duration sideBarAnimationDuration;

  /// This value is used to determine the space surrounding the SideBar and
  /// is usable when [enableFloating] is set to true.
  /// default value = EdgeInsets.all(8)
  final EdgeInsets floatingPadding;

  SideBarConfig({
    this.backgroundColor = sideBarBackgroundColor,
    this.bottomIconColor = sideBarUnselectedItemColor,
    this.dividerColor = sideBarDividerColor,
    this.selectedBoxColor = sideBarSelectedBoxColor,
    this.selectedIconColor = sideBarSelectedItemColor,
    this.unselectedBoxColor = sideBarBackgroundColor,
    this.unselectedIconColor = sideBarUnselectedItemColor,
    this.enableDivider = true,
    this.enableFloating = false,
    this.enablePageView = true,
    this.enableResizeBody = true,
    this.collapseWidth = 60.0,
    this.dividerIndent = 10,
    this.dividerThickness = 0.6,
    this.fontSize,
    this.iconSize,
    this.maxWidth = 260.0,
    this.tooltipDecoration,
    this.tooltipTextStyle,
    this.selectedTextStyle = const TextStyle(
      color: sideBarSelectedItemColor,
    ),
    this.unselectedTextStyle = const TextStyle(
      color: sideBarUnselectedItemColor,
    ),
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.sideBarCurve = Curves.ease,
    this.sideBarAnimationDuration = const Duration(milliseconds: 300),
    this.floatingPadding = const EdgeInsets.all(8),
  });
}
