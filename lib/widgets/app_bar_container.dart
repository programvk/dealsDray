import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0), // Margin around the AppBar
      child: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search here",
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.shopping_bag),
            prefixIconColor: Colors.red,
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
    );
  }
}
