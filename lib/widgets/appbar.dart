import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const MyAppBar({super.key, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/rick.svg",
              fit: BoxFit.contain,
              height: 60,
              width: 60,
              color: Color.fromARGB(255, 11, 218, 18),
            ),
            const Text(
              "Morty Matters",
              style: TextStyle(
                  color: Color.fromARGB(255, 11, 218, 18),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Get_Schwifty'),
            ),
          ],
        ),
        toolbarHeight: height,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
