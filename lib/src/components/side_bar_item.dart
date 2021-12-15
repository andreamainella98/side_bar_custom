import 'package:flutter/material.dart';
import 'package:side_bar_custom/src/support/side_bar_config.dart';

class SideBarItemWidget extends StatefulWidget {
  final SideBarConfig config;
  final String text;
  final String? tooltipText;
  final IconData icon;
  final bool openSideBar;
  final bool selectedItem;
  final VoidCallback onTapItem;

  const SideBarItemWidget({
    Key? key,
    required this.config,
    required this.text,
    required this.icon,
    required this.openSideBar,
    required this.onTapItem,
    this.tooltipText,
    this.selectedItem = false,
  }) : super(key: key);

  @override
  _SideBarItemWidgetState createState() => _SideBarItemWidgetState();
}

class _SideBarItemWidgetState extends State<SideBarItemWidget> {
  late double _iconSize;
  late double _iconPadding;
  late double _textSize;

  @override
  void initState() {
    super.initState();
    _iconPadding = widget.config.collapseWidth / 5;
    _iconSize = widget.config.collapseWidth * 4 / 5;
    _textSize = _iconPadding * 1.5;
  }

  @override
  Widget build(BuildContext context) {
    return _generateTooltip();
  }

  Widget _generateTooltip() {
    if (widget.tooltipText != null) {
      return Tooltip(
        message: widget.tooltipText!,
        preferBelow: true,
        decoration: widget.config.tooltipDecoration,
        textStyle: widget.config.tooltipTextStyle,
        waitDuration: const Duration(milliseconds: 500),
        child: _generateChild(),
      );
    }
    return _generateChild();
  }

  Widget _generateChild() {
    return InkWell(
      onTap: widget.onTapItem,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: widget.selectedItem
            ? widget.config.selectedBoxColor
            : widget.config.unselectedBoxColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(_iconPadding / 2),
              child: Icon(
                widget.icon,
                color: widget.selectedItem
                    ? widget.config.selectedIconColor
                    : widget.config.unselectedIconColor,
                size: _iconSize,
              ),
            ),
            Flexible(
              child: Text(
                widget.text,
                style: widget.selectedItem
                    ? widget.config.selectedTextStyle.copyWith(
                        fontSize: widget.config.fontSize ?? _textSize,
                      )
                    : widget.config.unselectedTextStyle.copyWith(
                        fontSize: widget.config.fontSize ?? _textSize,
                      ),
                overflow: TextOverflow.clip,
                maxLines: widget.openSideBar ? 2 : 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
