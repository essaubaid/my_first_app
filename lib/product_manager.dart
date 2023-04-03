import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  const ProductManager({super.key, required this.startingProduct});
  final String startingProduct;
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(product) => {
        setState(() => {_products.add(product)}),
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ProductControl(
            addProduct: _addProduct,
          ),
        ),
        Products(prodcuts: _products),
      ],
    );
  }
}
