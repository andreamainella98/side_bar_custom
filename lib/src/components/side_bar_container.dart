import 'package:flutter/material.dart';
import 'package:side_bar_custom/side_bar_custom.dart';

class SideBarContainer extends StatefulWidget {
  final SideBarConfig config;
  final AnimationController animationController;
  final Widget child;

  const SideBarContainer({
    Key? key,
    required this.config,
    required this.animationController,
    required this.child,
  }) : super(key: key);

  @override
  State<SideBarContainer> createState() => _SideBarContainerState();
}

class _SideBarContainerState extends State<SideBarContainer> {
  late Animation<double> _width;

  @override
  void initState() {
    super.initState();
    _width = Tween(
      begin: widget.config.collapseWidth,
      end: widget.config.maxWidth,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.config.sideBarCurve,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return SizedBox(
      width: _width.value,
      child: widget.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.animationController,
    );
  }
}
