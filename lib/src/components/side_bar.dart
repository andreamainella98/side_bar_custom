import 'package:flutter/material.dart';
import 'package:side_bar_custom/side_bar_custom.dart';
import 'package:side_bar_custom/src/components/side_bar_bottom_button.dart';
import 'package:side_bar_custom/src/components/side_bar_container.dart';
import 'package:side_bar_custom/src/components/side_bar_item.dart';
import 'package:side_bar_custom/src/support/side_bar_item.dart';

class SideBar extends StatefulWidget {
  final List<SideBarItem> items;
  final List<Widget> children;
  final SideBarConfig? config;
  final int initialIndex;

  const SideBar({
    Key? key,
    required this.items,
    required this.children,
    this.config,
    this.initialIndex = 0,
  })  : assert(items.length == children.length),
        super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  late SideBarConfig _config;
  late AnimationController _animationController;
  late PageController _pageController;
  late int _selectedIndex;

  bool _openSideBar = false;

  @override
  void initState() {
    super.initState();
    _config = widget.config ?? SideBarConfig();
    _selectedIndex = widget.initialIndex;

    _pageController = PageController(initialPage: _selectedIndex);
    _animationController = AnimationController(
      duration: _config.sideBarAnimationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _config.enableFloating
        ? Stack(
            children: [
              _generateBody(),
              Padding(
                padding: _config.floatingPadding,
                child: ClipRRect(
                  borderRadius: _config.borderRadius,
                  child: _buildChild(),
                ),
              ),
            ],
          )
        : _config.enableResizeBody
            ? Flex(
                direction: Axis.horizontal,
                children: [
                  _buildChild(),
                  Expanded(
                    child: _generateBody(),
                  ),
                ],
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: _config.collapseWidth),
                    child: _generateBody(),
                  ),
                  _buildChild(),
                ],
              );
  }

  Widget _generateBody() {
    if (_config.enablePageView) {
      return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => widget.children[index],
        controller: _pageController,
      );
    }
    return widget.children[_selectedIndex];
  }

  Widget _buildChild() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: _config.backgroundColor,
      ),
      child: SideBarContainer(
        config: _config,
        animationController: _animationController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: _generateItems(),
              ),
            ),
            if (_config.enableDivider) _generateDivider(),
            SideBarBottomButton(
              config: _config,
              animationController: _animationController,
              onTap: () async {
                if (_openSideBar) {
                  _changeOpenSideBar();
                  await _animationController.reverse().orCancel;
                } else {
                  await _animationController.forward().orCancel.then((value) => _changeOpenSideBar());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _generateItems() {
    List<Widget> temp = [];

    for (int i = 0; i < widget.items.length; i++) {
      SideBarItem item = widget.items[i];
      temp.add(SideBarItemWidget(
        config: _config,
        text: item.text,
        tooltipText: item.tooltipText,
        icon: item.icon,
        openSideBar: _openSideBar,
        selectedItem: _selectedIndex == i,
        onTapItem: () => setState(() {
          _selectedIndex = i;
          if (_config.enablePageView) {
            _pageController.animateToPage(
              _selectedIndex,
              duration: _config.sideBarAnimationDuration,
              curve: Curves.easeInOut,
            );
          }
        }),
      ));
    }
    return temp;
  }

  Widget _generateDivider() {
    return Divider(
      indent: _config.dividerIndent,
      endIndent: _config.dividerIndent,
      thickness: _config.dividerThickness,
      color: _config.dividerColor,
    );
  }

  void _changeOpenSideBar() {
    setState(() {
      _openSideBar = !_openSideBar;
    });
  }
}
