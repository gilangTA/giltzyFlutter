import 'package:flutter/material.dart';
import 'package:tugas_akhir/ChatPage.dart';
import 'package:tugas_akhir/HistoryPage.dart';
import 'package:tugas_akhir/HomePage.dart';
import 'package:tugas_akhir/ProfilePage.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = [
    HomePage(),
    HistoryPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: "History",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chat",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Profile",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    ));
  }
}
