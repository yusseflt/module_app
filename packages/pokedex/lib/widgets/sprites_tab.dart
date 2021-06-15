import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/loader_image.dart';
import 'package:pokedex/widgets/sprite_card.dart';

class SpritesTab extends StatefulWidget {
  final Sprites sprites;
  const SpritesTab({
    Key? key,
    required this.sprites,
  }) : super(key: key);

  @override
  _SpritesTabState createState() => _SpritesTabState();
}

class _SpritesTabState extends State<SpritesTab> {
  Sprites? sprites;

  @override
  void initState() {
    super.initState();
    sprites = widget.sprites;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SpriteCard(
            title: 'Gen I (Red/Blue)',
            imageUrl: sprites!.versions!.generationI!.redBlue!.frontDefault,
          ),
          SpriteCard(
            title: 'Gen II (Silver)',
            imageUrl: sprites!.versions!.generationIi!.silver!.frontDefault,
          ),
          SpriteCard(
            title: 'Gen III (Ruby/Saphire)',
            imageUrl:
                sprites!.versions!.generationIii!.rubySapphire!.frontDefault,
          ),
          SpriteCard(
            title: 'Gen IV (Platinum)',
            imageUrl: sprites!.versions!.generationIv!.platinum!.frontDefault,
          ),
          SpriteCard(
            title: 'Gen V (Black/White)',
            imageUrl: sprites!.versions!.generationV!.blackWhite!.frontDefault,
          ),
          SpriteCard(
            title: 'Gen VI (Sun/Moon)',
            imageUrl: sprites!
                .versions!.generationVii!.ultraSunUltraMoon!.frontDefault,
          ),
        ],
      ),
    );
  }
}
