import 'package:flutter/material.dart';
import 'package:pokedex/helpers/text_handler.dart';
import 'package:pokedex/models/pokemon_model.dart';

class AboutTab extends StatefulWidget {
  final int height;
  final int weight;
  final double? malePercentage;
  final List<Ability> abilities;

  const AboutTab({
    Key? key,
    required this.height,
    required this.weight,
    required this.abilities,
    this.malePercentage,
  }) : super(key: key);

  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  double? height;
  double? weight;
  List<Ability>? abilities;
  double? malePercentage;

  @override
  void initState() {
    super.initState();
    height = widget.height.toDouble() / 10;
    weight = widget.weight.toDouble() / 10;
    abilities = widget.abilities;
    malePercentage = widget.malePercentage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 20),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Text(
                  'Height: ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  '$height cm',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Text(
                  'Weight: ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  '$weight Kg',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Text(
                  'Abilities: ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                RichText(
                  text: TextSpan(
                    children: abilities!
                        .map<InlineSpan>(
                          (Ability ability) => TextSpan(
                            text: TextHandler.capitalizeFirstLetter(
                              '${ability.ability!.name!} ',
                            ),
                          ),
                        )
                        .toList(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Breeding',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Text(
                  'Gender: ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      '$malePercentage',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Icon(Icons.male),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
