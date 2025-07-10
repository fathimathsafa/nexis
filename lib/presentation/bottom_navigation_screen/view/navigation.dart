import 'package:flutter/material.dart';
import 'package:nexis/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:nexis/presentation/cart_screen/view/cart_screen.dart';
import 'package:nexis/presentation/home_screen/view/home_screen.dart';
import 'package:nexis/presentation/hub_screen/view/hub_screen.dart';
import 'package:nexis/presentation/market_screen/view/market_screen.dart';
import 'package:nexis/presentation/member_screen/view/member_screen.dart';
import 'package:nexis/presentation/profile_screen/view/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MarketplaceScreen(),
    AppCardScreen(),
    MembershipStatusScreen(),
    CartScreen(),
   UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NexisBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
