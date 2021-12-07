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
  late SideBarConfig config;
  late AnimationController _animationController;
  late PageController _pageController;
  late int selectedIndex;

  bool _openSideBar = false;

  @override
  void initState() {
    super.initState();
    config = widget.config ?? SideBarConfig();
    selectedIndex = widget.initialIndex;

    _pageController = PageController(initialPage: selectedIndex);
    _animationController = AnimationController(
      duration: config.sideBarAnimationDuration,
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
    return config.enableFloating
        ? Stack(
            children: [
              _generateBody(),
              Padding(
                padding: config.floatingPadding,
                child: ClipRRect(
                  borderRadius: config.borderRadius,
                  child: _buildChild(),
                ),
              ),
            ],
          )
        : config.enableResizeBody
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
                    padding: EdgeInsets.only(left: config.collapseWidth),
                    child: _generateBody(),
                  ),
                  _buildChild(),
                ],
              );
  }

  Widget _generateBody() {
    if (config.enablePageView) {
      return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => widget.children[index],
        controller: _pageController,
      );
    }
    return widget.children[selectedIndex];
  }

  Widget _buildChild() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: config.backgroundColor,
      ),
      child: SideBarContainer(
        config: config,
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
            if (config.enableDivider) _generateIndent(),
            SideBarBottomButton(
              config: config,
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
        config: config,
        text: item.text,
        tooltipText: item.tooltipText,
        icon: item.icon,
        openSideBar: _openSideBar,
        selectedItem: selectedIndex == i,
        onTapItem: () => setState(() {
          selectedIndex = i;
          if (config.enablePageView) {
            _pageController.animateToPage(
              selectedIndex,
              duration: config.sideBarAnimationDuration,
              curve: Curves.easeInOut,
            );
          }
        }),
      ));
    }
    return temp;
  }

  Widget _generateIndent() {
    return Divider(
      indent: config.dividerIndent,
      endIndent: config.dividerIndent,
      thickness: config.dividerThickness,
      color: config.dividerColor,
    );
  }

  void _changeOpenSideBar() {
    setState(() {
      _openSideBar = !_openSideBar;
    });
  }
}
