//widgets/settings_page.dart
import 'package:flutter/material.dart';

import '../data/products.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => SwitchListTile(
          title: Text(categories[index].name),
          value: categories[index].isEnabled,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
