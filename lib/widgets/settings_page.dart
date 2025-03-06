//widgets/settings_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/settings_state_provider.dart';
import '../data/products.dart';
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<FilterProductsModel>(
        builder: (context, categories, child) => ListView.builder(
          itemCount: categories.allCategories.length,
          itemBuilder: (context, index) {
            var category = categories.allCategories[index];
            return SwitchListTile(
              title: Text(category.name),
              value: category.isEnabled,
              onChanged: (value) {
                categories.toggleCategory(category);
              },
            );
          },
        ),
      ),
    );
  }
}
