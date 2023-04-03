import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  const ProductControl({super.key, required this.addProduct});
  final Function addProduct;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        addProduct('New Product'),
      },
      child: const Text('Press me'),
    );
  }
}
