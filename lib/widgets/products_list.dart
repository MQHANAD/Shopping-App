//widgets/products_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/products.dart';
import '../data/settings_state_provider.dart';
import 'detail_page.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.products,
    required this.addToCart,
  }) : super(key: key);
  final void Function(Product) addToCart;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProductsModel>(
        builder: (context, filterProductModel, child) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filterProductModel.enabledProducts.length,
              itemBuilder: (context, index) {
                final product = filterProductModel.enabledProducts[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () async {
                    final Product? result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                    if (result != null) {
                      addToCart(result);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text(result?.name ?? 'Nothing added to the cart'),
                        backgroundColor:
                            result == null ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
              },
        )
    );
  }
}
