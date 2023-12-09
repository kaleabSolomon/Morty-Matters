import 'package:flutter/material.dart';
import 'package:rickandmorty/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(height: MediaQuery.of(context).size.height * 0.08),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage("assets/r&m.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken))),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 21, 21, 21),
          items: const [
            BottomNavigationBarItem(

                // backgroundColor: Color.fromARGB(255, 11, 218, 18),
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 11, 218, 18),
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 11, 218, 18),
              ),
              label: "",
            )
          ]),
    );
  }
}
