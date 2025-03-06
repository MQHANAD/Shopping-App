//widgets/products_list.dart
import 'package:flutter/material.dart';
import '../data/products.dart';
import 'detail_page.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(result?.name ?? 'Nothing added to the cart'),
                      backgroundColor:
                          result == null ? Colors.red : Colors.green,
                    ),
                  );
                }),
          );
        });
  }
}
