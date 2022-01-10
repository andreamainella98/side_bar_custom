<div align="center">
    <img src="https://raw.githubusercontent.com/andreamainella98/side_bar_custom/master/images/icon.png">
</div>

## DESCRIPTION
This package allows you to have a new simple and fast "SideBar" component, with many possibilities to customize it.

## HOW TO INSTALL
```yaml
dependencies:
  flutter:
    sdk: flutter
  side_bar_custom: ^1.0.3
```

## HOW TO USE
```dart
SideBar(
    children: [
        Center(
            child: Text("Dashboard"),
        ),
        Center(
            child: Text("Add User"),
        ),
    ],
    items: [
        SideBarItem(
            text: "Dashboard", 
            icon: Icons.home, 
            tooltipText: "Dashboard page",
        ),
        SideBarItem(
            text: "Add User", 
            icon: Icons.add,
        ),
    ],
),
```

## SCREENSHOT
<img src="https://raw.githubusercontent.com/andreamainella98/side_bar_custom/master/images/example.gif" width="425" height="320">

## UTILS
### SideBarConfig

| Props                    | Description                                                                                                                   |      Required      | Default Value                              |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------|:------------------:|--------------------------------------------|
| backgroundColor          | This color is used to change the background color of the SideBar.                                                             | :white_check_mark: | ```Color(0xff303F9F)```                    |
| bottomIconColor          | This color is used to change the color of bottom icon of the SideBar.                                                         | :white_check_mark: | ```Color(0xff448AFF)```                    |
| dividerColor             | This color is used to change the color of divider of SideBar.                                                                 | :white_check_mark: | ```Color(0xff448AFF)```                    |
| selectedBoxColor         | This color is used to change the background of the single selected item.                                                      | :white_check_mark: | ```Color(0xff3F51B5)```                    |
| selectedIconColor        | This color is used to change the color of icon of the single selected item.                                                   | :white_check_mark: | ```Color(0xffC5CAE9)```                    |
| unselectedBoxColor       | This color is used to change the background of the single unselected item.                                                    | :white_check_mark: | ```Color(0xff303F9F)```                    |
| unselectedIconColor      | This color is used to change the color of icon of the single selected item.                                                   | :white_check_mark: | ```Color(0xff448AFF)```                    |
| enableDivider            | This value is used to enable the SideBar divider.                                                                             | :white_check_mark: | ```true```                                 |
| enableFloating           | This value is used to enable the SideBar to become floating.                                                                  | :white_check_mark: | ```false```                                |
| enablePageView           | This value is used to enable the animation to the children of SideBar.                                                        | :white_check_mark: | ```true```                                 |
| enableResizeBody         | This value is used to enable the resize of the SideBar body, if set to false the children in the body will have a fixed size. | :white_check_mark: | ```true```                                 |
| collapseWidth            | This value determines the width of the SideBar when it is collapsed.                                                          | :white_check_mark: | ```60.0```                                 |
| dividerIndent            | This value is used to determine the spacing of the divider in the left and right edges.                                       | :white_check_mark: | ```10.0```                                 |
| dividerThickness         | This value is used to determine the thickness of the Divider inside the SideBar.                                              | :white_check_mark: | ```0.6```                                  |
| fontSize                 | This optional value is used to set the size of the SideBarItem font.                                                          |        :x:         |                                            |
| iconSize                 | This optional value is used to set the size of the SideBarItem icon.                                                          |        :x:         |                                            |
| maxWidth                 | This value determines the width of the SideBar when it is not collapsed.                                                      | :white_check_mark: | ```260.0```                                |
| tooltipDecoration        | This value is used to set a style for Tooltips when they are enabled.                                                         |        :x:         |                                            |
| tooltipTextStyle         | This value is used to set a style for Text inside Tooltips when they are enabled.                                             |        :x:         |                                            |
| selectedTextStyle        | This value is used to set a style for Text inside SideBarItem when it is selected.                                            | :white_check_mark: | ```TextStyle(color: Color(0xffC5CAE9))```  |
| unselectedTextStyle      | This value is used to set a style for Text inside SideBarItem when it is unselected.                                          | :white_check_mark: | ```TextStyle(color: Color(0xff448AFF))```  |
| borderRadius             | This value is used when [enableFloating] is set to true and is used to set a radius at the edges of the SideBar.              | :white_check_mark: | ```BorderRadius.all(Radius.circular(6))``` |
| sideBarCurve             | This value is used to indicate an animation curve for all SideBar animations.                                                 | :white_check_mark: | ```Curves.ease```                          |
| sideBarAnimationDuration | This value is used to indicate a duration for all SideBar animations.                                                         | :white_check_mark: | ```Duration(milliseconds: 300)```          |
| floatingPadding          | This value is used to determine the space surrounding the SideBar and is usable when [enableFloating] is set to true.         | :white_check_mark: | ```EdgeInsets.all(8)```                    |

### SideBarItem

| Props       | Description                                                                         |      Required      |
|-------------|-------------------------------------------------------------------------------------|:------------------:|
| text        | This value used for set text of SideBarItem.                                        | :white_check_mark: |
| tooltipText | This value used for set tooltip text of SideBarItem, if setted the tooltip show up. |        :x:         |
| icon        | This value used for set icon of SideBarItem.                                        | :white_check_mark: |

## NEXT FEATURE

Write me in the [GitHub](https://github.com/andreamainella98/side_bar_custom/issues) issues the new features you need and, if they are approved of course, I will implement them as soon as I can.