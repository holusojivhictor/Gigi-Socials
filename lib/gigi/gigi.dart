import 'package:flutter/material.dart';
import 'package:gigi_socials/gigi/home.dart';
import 'package:gigi_socials/gigi/games.dart';
import 'package:gigi_socials/gigi/subscription.dart';
import 'package:gigi_socials/gigi/settings.dart';

class Gigi extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return GigiPages();
  }
}

class GigiPages extends State<Gigi> {
  int _currentIndex = 0;
  final List<Widget> _children = const <Widget>[
    Home(),
    Games(),
    Subscription(),
    Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.white,
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white10, width: .5)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey.shade500,
            showUnselectedLabels: true,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.gamepad),
                label: 'Browse',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.style),
                label: 'My Games',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
              ),
            ],
          ),
        ),
      ),
    );
  }
}