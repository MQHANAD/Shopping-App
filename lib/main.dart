// main.dart
import 'package:flutter/material.dart';
import 'data/cart_state_inherited.dart';
import 'widgets/products_tabs.dart';
import 'widgets/settings_page.dart';
import 'widgets/wishlist_page.dart';
import 'package:lab6/data/settings_state_provider.dart';
import 'package:provider/provider.dart';
import '../data/products.dart';

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
    ],
    child: MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Shopping App'),
    )
    );

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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _screens =  [
    ProductsCartTabBar(),
    WishList(),
  ];

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage();
                }));
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
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