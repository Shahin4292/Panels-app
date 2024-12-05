import 'package:flutter/material.dart';
import 'package:pannels/pages/account_page.dart';
import 'package:pannels/pages/explore_page.dart';
import 'package:pannels/pages/home_page.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const ExplorePage(),
      const AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 32,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Account"),
        ],
      ),
    );
  }
}
