import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'weather');
              },
              child: Text('Clima'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'pokedex');
              },
              child: Text('Pokedex'),
            ),
          ],
        ),
      ),
    );
  }
}
