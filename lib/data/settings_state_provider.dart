import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:lab6/data/products.dart';
class FilterProductsModel extends ChangeNotifier {
  List<Category> allCategories = categories;
  List<Product> enabledProducts = products;
  void toggleCategory(Category category) {
    category.isEnabled = !category.isEnabled;
    enabledProducts =
        products.where((product)=>product.category.isEnabled).toList();
    notifyListeners();
  }
}