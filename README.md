<img src="https://raw.githubusercontent.com/andreamainella98/side_bar_custom/master/images/icon.png" style="display: block; margin-left: auto; margin-right: auto;">

## DESCRIPTION
This package allows you to have a new simple and fast "SideBar" component, with many possibilities to customize it.

## HOW TO INSTALL
```yaml
dependencies:
  flutter:
    sdk: flutter
  side_bar_custom: ^1.0.0
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