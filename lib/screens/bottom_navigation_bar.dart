import 'package:deals_dray/screens/bottomappbar/deals_screen.dart';
import 'package:deals_dray/screens/bottomappbar/user_profile_screen.dart';
import "package:flutter/material.dart";
import 'bottomappbar/cart_screen.dart';
import 'bottomappbar/category_screen.dart';
import "home_screen.dart";

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': "Home"},
    {'page': const CategoryScreen(), 'title': "Category"},
    {'page': const DealsScreen(), 'title': "Deals"},
    {'page': const CartScreen(), 'title': "Cart"},
    {'page': const UserProfileScreen(), 'title': "Profile"},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _selectedPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? Icons.category_rounded
                : Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2
                ? Icons.local_offer_rounded
                : Icons.local_offer_outlined),
            label: "Deals",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3
                ? Icons.shopping_cart_rounded
                : Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4
                ? Icons.people_alt_rounded
                : Icons.people_alt_outlined),
            label: "User",
          ),
        ],
      ),
    );
  }
}
