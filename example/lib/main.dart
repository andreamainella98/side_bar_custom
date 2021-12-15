import 'package:flutter/material.dart';
import 'package:side_bar_custom/side_bar_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = const [
    Center(
      child: Text("Dashboard"),
    ),
    Center(
      child: Text("Add User"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SideBar Custom'),
          backgroundColor: const Color(0xff303F9F),
          elevation: 0,
        ),
        body: SideBar(
          children: pages,
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
          config: SideBarConfig(
            enablePageView: true,
          ),
        ),
      ),
    );
  }
}
