import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:lab6/data/products.dart'; // Import your Product class

class WishlistStateProvider extends ChangeNotifier {
  // List of products in the wishlist
  List<Product> _wishlist = [];

  // Getter for the wishlist
  List<Product> get wishlist => _wishlist;

  // Add a product to the wishlist
  void addToWishlist(Product product) {
    _wishlist.add(product);
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Remove a product from the wishlist
  void removeFromWishlist(Product product) {
    _wishlist.remove(product);
    notifyListeners(); // Notify listeners that the state has changed
  }
}