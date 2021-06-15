import 'package:flutter/material.dart';
import 'package:pokedex/widgets/loader_image.dart';

class SpriteCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  const SpriteCard({
    Key? key,
    required this.title,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Container(
            width: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                imageUrl != null ? LoaderImage('$imageUrl') : Container(),
              ],
            ),
          )
        : Container();
  }
}
