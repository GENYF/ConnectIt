import 'package:connectit/screens/board/board_screen.dart';
import 'package:connectit/screens/profile/profile_screen.dart';
import 'package:connectit/screens/storage/storage_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/design.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Widget> _screens = [
    const StorageScreen(),
    const BoardScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            backgroundColor: Colors.white,
            onTap: (index) => _onItemTapped(index),
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            selectedLabelStyle: DesignerTextStyle.navigationBold,
            unselectedLabelStyle: DesignerTextStyle.navigationBasic,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.storage_outlined,
                  size: 24,
                  color: _selectedIndex == 0 ? Colors.black : Colors.black12,
                ),
                label: '보관함',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.article_outlined,
                  size: 24,
                  color: _selectedIndex == 1 ? Colors.black : Colors.black12,
                ),
                label: '보드',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  size: 24,
                  color: _selectedIndex == 2 ? Colors.black : Colors.black12,
                ),
                label: '내정보',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}