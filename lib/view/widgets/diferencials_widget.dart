import 'package:flutter/material.dart';

class DiferencialsList extends StatelessWidget {
  const DiferencialsList({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
