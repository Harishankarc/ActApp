import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/navigation/dashboard.dart';
import 'package:actapp/frontend/navigation/invitation.dart';
import 'package:actapp/frontend/navigation/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    Invitation(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              API.appcolor,
              API.subcolor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.transparent,
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Dashboard',
              iconColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const GButton(
              icon: Icons.mail_outline,
              text: 'Invitation',
              iconColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const GButton(
              icon: Icons.person_outline,
              text: 'My Account',
              iconColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
