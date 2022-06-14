import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.textButton,
    required this.onTapButton,
    required this.backgroundColor,
  }) : super(key: key);

  final String textButton;
  final VoidCallback onTapButton;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(50)),
        height: 48,
        width: 240,
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
