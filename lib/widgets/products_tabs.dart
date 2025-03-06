//widgets/products_tabs.dart
import 'package:flutter/material.dart';
import '../data/products.dart';
import 'cart_page.dart';
import 'products_list.dart';

class ProductsCartTabBar extends StatelessWidget {
  const ProductsCartTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  count: 0,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.shopping_cart),
                ),
                text: 'Cart',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              ProductsList(products: products,),
              CartPage(),
            ]),
          ),
        ],
      ),
    );
  }
}
