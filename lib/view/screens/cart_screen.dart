import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:xtintas_app/controller/stores/cart_store.dart';

import '../widgets/card_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartStore cartStore = CartStore();

  @override
  void initState() {
    cartStore.getCarts();
    super.initState();
  }

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
      body: Observer(builder: (context) {
        return cartStore.carts.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: cartStore.carts.length,
                  itemBuilder: (context, index) => CardCart(
                    sizeScreen: sizeScreen,
                    src: cartStore.carts[index].paint!.image!,
                    title: cartStore.carts[index].paint!.name!,
                    unit: cartStore.carts[index].quantity!,
                    price: cartStore.carts[index].paint!.price!,
                  ),
                ),
              )
            : Center(
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_sjcbakkb.json'));
      }),
    );
  }
}
