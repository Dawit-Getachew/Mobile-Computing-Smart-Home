import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_computing_smart_home/screen/Home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOption = <Widget>[
    const Home(),
    const Text('Explore'),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore),
            //activeIcon: Icon(FluentSystemIcons.ic_fluent_navigation_filled),
            label: '',
          ),
        ],
        backgroundColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        selectedItemColor: HexColor('#6FC1C5'),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
