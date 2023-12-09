import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {},
        selectedItemColor: const Color.fromARGB(255, 0, 255, 8),
        iconSize: 30,
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 47, 159, 51),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 47, 159, 51),
            ),
            label: "",
          )
        ]);
  }
}
