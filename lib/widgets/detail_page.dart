//widgets/detail_page.dart
import 'package:flutter/material.dart';
import '../data/products.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.network(product.imageUrl),
              const SizedBox(height: 16),
              Text(product.description,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              // TODO: Add a button to add the product to wishlist
              ElevatedButton(
                child: const Text('Add to Cart'),
                onPressed: () {
                  Navigator.pop(context, product);
                },
              ),
              ElevatedButton(
                child: const Text('Add to wishlist'),
                onPressed: () {
                  Navigator.pop(context, product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
