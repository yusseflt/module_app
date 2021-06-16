import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Widget icon;
  final Color buttonColor;

  const ModuleCard({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
