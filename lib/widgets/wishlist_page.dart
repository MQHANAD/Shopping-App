// widgets/wishlist_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lab6/data/products.dart';
import '../data/products.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Wishlist'),
    );
  }
}






// class WishList extends StatelessWidget {
//   const WishList({
//     Key? key,
//     required this.productsInWishList,
//     required this.removeFromWishList,
//   }) : super(key: key);
//
//   final List<Product> productsInWishList;
//   final Function(Product) removeFromWishList;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: productsInWishList.isEmpty
//           ? 1 // Only show the ApplyNewCustomerDiscount widget
//           : productsInWishList.length + 1, // Show products + ApplyNewCustomerDiscount
//       itemBuilder: (context, index) {
//         // If the wishlist is empty, show the ApplyNewCustomerDiscount widget
//
//         // Otherwise, show the product at the current index
//         return ListTile(
//           leading: Image.network(productsInWishList[index].imageUrl),
//           title: Text(productsInWishList[index].name),
//           trailing: IconButton(
//             icon: const Icon(Icons.remove_circle_outline),
//             onPressed: () => removeFromWishList(productsInWishList[index]),
//           ),
//         );
//       },
//     );
//   }
// }
// class ProductsWishList extends StatefulWidget {
//   const ProductsWishList({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<ProductsWishList> createState() => _ProductsWishListState();
// }
//
// class _ProductsWishListState extends State<ProductsWishList>{
//   final wishProducts = products.sublist(0, 3).toList();
//
//   void addToWishList(Product product) {
//     setState(() {
//       wishProducts.add(product);
//     });
//   }
//
//   void removeFromWishList(Product product) {
//     setState(() {
//       wishProducts.remove(product);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("Text");
//   }
// }