import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const MyAppBar({super.key, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/rick.svg",
            fit: BoxFit.contain,
            height: 60,
            width: 60,
          ),
          const Text(
            "Morty Matters",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      toolbarHeight: height,
      backgroundColor: Colors.green,
    );
  }
}
