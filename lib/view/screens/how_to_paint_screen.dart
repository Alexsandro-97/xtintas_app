import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HowToPaintScreen extends StatelessWidget {
  const HowToPaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Como pintar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(),
          const Text('data'),
          Row(),
          const Text('data'),
          const Icon(Icons.arrow_downward),
          Row(),
          const Text('data'),
          const Icon(Icons.lock_clock)
        ],
      ),
    );
  }
}
