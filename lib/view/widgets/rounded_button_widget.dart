import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onTapButton,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTapButton;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(50)),
        height: 48,
        width: 240,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
