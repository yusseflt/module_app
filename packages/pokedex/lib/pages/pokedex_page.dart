import 'package:flutter/material.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.network(
          'https://www.pkparaiso.com/imagenes/xy/sprites/animados/charmander.gif',
          loadingBuilder: (context, child, loader) {
            if (loader == null) {
              return Center(child: child);
            }
            return Center(
                child: CircularProgressIndicator(
              value: loader.expectedTotalBytes != null
                  ? loader.cumulativeBytesLoaded / loader.expectedTotalBytes!
                  : null,
            ));
          },
        ),
      ),
    );
  }
}
