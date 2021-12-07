import 'package:flutter/material.dart';
import 'package:side_bar_custom/src/support/side_bar_config.dart';
import 'package:side_bar_custom/src/utils/colors.dart';

class SideBarBottomButton extends StatefulWidget {
  final SideBarConfig config;
  final AnimationController animationController;
  final VoidCallback onTap;

  const SideBarBottomButton({
    Key? key,
    required this.config,
    required this.animationController,
    required this.onTap,
  }) : super(key: key);

  @override
  _SideBarBottomButtonState createState() => _SideBarBottomButtonState();
}

class _SideBarBottomButtonState extends State<SideBarBottomButton> {
  late double _iconSize;
  late double _iconPadding;

  @override
  void initState() {
    super.initState();
    _iconPadding = widget.config.collapseWidth / 5;
    _iconSize = widget.config.collapseWidth * 4 / 5;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.all(_iconPadding / 2),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5).animate(
              CurvedAnimation(
                parent: widget.animationController,
                curve: widget.config.sideBarCurve,
              ),
            ),
            child: Icon(
              Icons.chevron_right,
              size: _iconSize,
              color: sideBarUnselectedItemColor,
            ),
          ),
        ),
      ),
    );
  }
}
