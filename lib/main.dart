// main.dart
import 'package:flutter/material.dart';
import 'data/cart_state_inherited.dart';
import 'data/wishlist_state_provider.dart';
import 'widgets/products_tabs.dart';
import 'widgets/settings_page.dart';
import 'widgets/wishlist_page.dart';
import 'package:lab6/data/settings_state_provider.dart';
import 'package:provider/provider.dart';
import '../data/products.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FilterProductsModel>(
            create: (_) => FilterProductsModel(),
          ),
          ChangeNotifierProvider<WishlistStateProvider>(
            create: (_) => WishlistStateProvider(), // Add WishlistStateProvider
          ),
        ],
        child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: false,
          ),
          home: const MyHomePage(title: 'Shopping App'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cartProducts = products.sublist(0, 3).toList();
  int _selectedIndex = 0;

  void addToCart(Product product) {
    setState(() {
      cartProducts.add(product);
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      cartProducts.remove(product);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _screens = [
    ProductsCartTabBar(),
    WishList(),
  ];

  @override
  Widget build(BuildContext context) {
    // Access the WishlistStateProvider
    final wishlistProvider = Provider.of<WishlistStateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Shopping App'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: CartStateInherited(
        cartContentList: cartProducts,
        addToCart: addToCart,
        removeFromCart: removeFromCart,
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              key: const Key('wishlist_badge'), // Add a key
              badgeContent: Text(
                wishlistProvider.wishlist.length.toString(), // Number of items in the wishlist
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.favorite), // Wishlist icon
            ),
            label: 'Wishlist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}