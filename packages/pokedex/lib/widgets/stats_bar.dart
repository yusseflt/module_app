import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final String statName;
  final int limit;
  final int baseStat;
  const StatsBar({
    Key? key,
    required this.statName,
    required this.limit,
    required this.baseStat,
  }) : super(key: key);

  Color getStatsColor(int baseStat) {
    if (baseStat <= 35) {
      return Colors.red.shade600;
    } else if (baseStat > 35 && baseStat <= 60) {
      return Colors.orange.shade600;
    } else if (baseStat > 60 && baseStat <= 90) {
      return Colors.green.shade400;
    } else if (baseStat > 90 && baseStat <= 120) {
      return Colors.green.shade600;
    } else {
      return Colors.teal.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('$statName: $baseStat'),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.grey.shade200,
                value: baseStat / limit,
                valueColor:
                    AlwaysStoppedAnimation<Color>(getStatsColor(baseStat)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
