//widgets/cart_page.dart
import 'package:flutter/material.dart';
import 'package:lab6/data/products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.productsInCart, required
  this.removeFromCart});
  final List<Product> productsInCart;
  final Function(Product) removeFromCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsInCart.length + 1,
        itemBuilder: (context, index) {
          if (index == productsInCart.length) {
            return const ApplyNewCustomerDiscount();
          }
          return ListTile(
            leading: Image.network(productsInCart[index].imageUrl),
            title: Text(productsInCart[index].name),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => removeFromCart(productsInCart[index]),
            ),
          );
        });
  }
}

class ApplyNewCustomerDiscount extends StatefulWidget {
  const ApplyNewCustomerDiscount({super.key});
  @override
  State<ApplyNewCustomerDiscount> createState() =>
      _ApplyNewCustomerDiscountState();
}

class _ApplyNewCustomerDiscountState extends State<ApplyNewCustomerDiscount> {
  bool isApplied = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isApplied ? Colors.lightGreen : Colors.lightBlue.shade50,
              ),
              child: Text(isApplied
                  ? 'Discount Applied'
                  : 'Apply New Customer Discount')),
          IconButton(
              onPressed: () {
                setState(() {
                  isApplied = !isApplied;
                });
              },
              icon: isApplied
                  ? const Icon(Icons.remove_circle, color: Colors.red)
                  : const Icon(Icons.check_circle, color: Colors.green)),
        ],
      ),
    );
  }
}
