import 'package:flutter/material.dart';
import 'package:module_app/widgets/module_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 80,
          ),
          children: [
            ModuleCard(
              onPressed: () {
                Navigator.pushNamed(context, 'weather');
              },
              title: 'Weather',
              buttonColor: Colors.lightBlue.shade400,
              icon: Icon(
                Icons.wb_sunny_rounded,
                color: Colors.white,
              ),
            ),
            ModuleCard(
              onPressed: () {
                Navigator.pushNamed(context, 'pokedex');
              },
              title: 'Pokedex',
              buttonColor: Colors.red.shade400,
              icon: Image.asset(
                'assets/png/pokeball.png',
                package: 'pokedex',
                color: Colors.white,
                width: 20,
                height: 20,
              ),
            ),
            ModuleCard(
              onPressed: () {
                Navigator.pushNamed(context, 'musicList');
              },
              buttonColor: Colors.teal.shade400,
              title: 'Music Player',
              icon: Icon(
                Icons.library_music,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
