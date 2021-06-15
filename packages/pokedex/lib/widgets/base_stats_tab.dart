import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/stats_bar.dart';

class BaseStatsTab extends StatefulWidget {
  final List<Stat> stats;
  const BaseStatsTab({Key? key, required this.stats}) : super(key: key);

  @override
  _BaseStatsTabState createState() => _BaseStatsTabState();
}

class _BaseStatsTabState extends State<BaseStatsTab> {
  List<Stat>? stats;
  int limit = 100;

  @override
  void initState() {
    super.initState();

    stats = widget.stats;
    stats!.forEach((element) {
      if (element.baseStat! > 100) {
        limit = element.baseStat!;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: stats!
            .map<Widget>(
              (Stat stat) => StatsBar(
                baseStat: stat.baseStat!,
                limit: limit,
                statName: stat.stat!.name!,
              ),
            )
            .toList(),
      ),
    );
  }
}
