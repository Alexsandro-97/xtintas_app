import 'package:flutter/material.dart';

import '../widgets/card_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 3,
          itemBuilder: (context, index) => CardCart(
            sizeScreen: sizeScreen,
            title: 'Tinta Suvinil Criativa',
            unit: 1,
            price: 95,
          ),
        ),
      ),
    );
  }
}
