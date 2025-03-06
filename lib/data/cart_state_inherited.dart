import 'package:flutter/material.dart';
import 'products.dart';
class CartStateInherited extends InheritedWidget {
  CartStateInherited({
    Key? key,
    required this.cartContentList,
    required this.addToCart,
    required this.removeFromCart,
    required Widget child,
  }) : super(key: key, child: child);
  final List<Product> cartContentList;
  final void Function(Product) addToCart;
  final void Function(Product) removeFromCart;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
  static CartStateInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartStateInherited>()!;
  }
}