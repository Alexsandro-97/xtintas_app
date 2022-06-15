import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.sizeScreen,
    required this.onTapButton,
  }) : super(key: key);

  final Size sizeScreen;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        height: sizeScreen.height * 0.08,
        width: sizeScreen.width,
        decoration: BoxDecoration(
          color: const Color(0xFFEAEAEA).withOpacity(0.28),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: const Color(0xFF404040).withOpacity(0.28),
          ),
        ),
        child: const Center(
            child: Text(
          'Fazer logout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF5B4DA7),
          ),
        )),
      ),
    );
  }
}
