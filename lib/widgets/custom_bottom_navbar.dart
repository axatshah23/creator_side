import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../constants.dart';
import '../creator_module/creator_screen.dart';
import '../home_module/home_screen.dart';
import '../menu_module/menu_screen.dart';
import '../notifications_module/notifications_screen.dart';
import '../watcher_module/watcher_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key? key, required this.currIndex}) : super(key: key);
  int currIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  /// NavBar Items
  List<BottomNavigationBarItem> navbar = [
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.play),
      label: 'Creator',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.movie_creation_outlined),
      label: 'Watcher',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.notification),
      label: 'Notification',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'Menu',
    ),
  ];

  /// NavBar Screens
  final List<Widget> _screens = const [
    HomeScreen(),
    CreatorScreen(),
    WatcherScreen(),
    NotificationScreen(),
    MenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 75.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), // adjust to your liking
            topRight: Radius.circular(16.0), // adjust to your liking
          ),
          color: kNavBarBackgroundColor, // put the color here
        ),
        child: BottomNavigationBar(
          elevation: kNavBarElevation,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: kNavBarSelectedItemColor,
          selectedLabelStyle: kNavBarSelectedItemTextStyle,
          unselectedItemColor: kUnSelectedItemColor,
          unselectedLabelStyle: kNavBarUnSelectedItemTextStyle,
          iconSize: kNavBarIconSize,
          currentIndex: widget.currIndex,
          items: navbar,
          onTap: (changedIndex) {
            setState(() {
              widget.currIndex = changedIndex;
            });
          },
        ),
      ),
    );
  }
}
