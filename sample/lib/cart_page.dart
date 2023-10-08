import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  String totalProduct;
  CartPage({
    Key? key,
    required this.totalProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          totalProduct,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
