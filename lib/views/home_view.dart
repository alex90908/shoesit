import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/views/components/bodyApp.dart';
import 'package:sewain_aku/views/components/navbar.dart';
import 'package:sewain_aku/views/login.dart';
import 'package:sewain_aku/views/masuk.dart';
import 'package:sewain_aku/views/components/checkout.dart';
import 'package:sewain_aku/views/components/P4rofile.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BodyApp(),
    FoodCheckoutOnePage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color(0xFFF6925C),
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFFFFF5F1),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
