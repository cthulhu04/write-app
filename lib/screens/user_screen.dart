import 'package:flutter/material.dart';
import 'package:write_app/config/config.dart';
import 'package:write_app/screens/screens.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    DocumentScreen(),
    ReadNodeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.mainColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.white12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Reader mode',
          ),
        ],
      ),
    );
  }
}
