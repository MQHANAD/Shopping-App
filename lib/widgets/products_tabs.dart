//widgets/products_tabs.dart
import 'package:flutter/material.dart';
import '../data/cart_state_inherited.dart';
import '../data/products.dart';
import 'cart_page.dart';
import 'products_list.dart';
import '../data/products.dart';

class ProductsCartTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartStateInherited cartStateInherited =
    CartStateInherited.of(context);
    final cartProducts = cartStateInherited.cartContentList;
    final addToCart = cartStateInherited.addToCart;
    final removeFromCart = cartStateInherited.removeFromCart;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(color: Colors.blue),
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'Products',
              ),
              Tab(
                icon: Badge.count(
                  count: cartProducts.length,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.shopping_cart),
                ),
                text: 'Cart',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              ProductsList(
                products: products,
                addToCart: addToCart,
              ),
              CartPage(
                productsInCart: cartProducts,
                removeFromCart: removeFromCart,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}


