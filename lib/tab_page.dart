import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _selectedIndex = 0;

  List pages = ['Home', 'Search', 'Account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(pages[_selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
