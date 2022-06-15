import 'package:flutter/material.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    Key? key,
    required this.sizeScreen,
    required this.title,
    required this.unit,
    required this.price,
  }) : super(key: key);

  final Size sizeScreen;
  final String title;
  final int unit;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: sizeScreen.height * 0.15,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA).withOpacity(0.28),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: const Color(0xFF404040).withOpacity(0.28),
        ),
      ),
      child: Row(
        children: [
          Container(
            color: Colors.red,
            height: sizeScreen.height * 0.13,
            width: 60,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: Colors.grey,
                height: 1.5,
                width: sizeScreen.width * 0.55,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 8,
                        child: Icon(Icons.remove),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('$unit un.'),
                      ),
                      const CircleAvatar(
                        minRadius: 8,
                        child: Icon(Icons.add),
                      )
                    ],
                  ),
                  SizedBox(width: sizeScreen.width * 0.15),
                  Text('R\$ $price,00'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}