import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.prodcuts});
  final List<String> prodcuts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: prodcuts
          .map(
            (element) => Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/food.jpg'),
                  Text(element),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
