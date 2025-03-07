import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/products.dart';
import '../data/wishlist_state_provider.dart';


class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the WishlistStateProvider
    final wishlistProvider = Provider.of<WishlistStateProvider>(context, listen: false);

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
              Text(
                product.description,
                style: const TextStyle(fontSize: 20),
              ),
              OutlinedButton(
                key: const Key('add_to_wishlist'), // Add a key
                onPressed: () {
                  // Add the product to the wishlist
                  wishlistProvider.addToWishlist(product);
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: const Text('Add to Wishlist'),
              ),

              ElevatedButton(
                child: const Text('Add to Cart'),
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