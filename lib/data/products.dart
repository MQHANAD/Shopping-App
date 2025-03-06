//data/products.dart
class Product {
  final String id;
  final Category category;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Category {
  final String id;
  final String name;
  bool isEnabled = true;
  Category({required this.id, required this.name});
}

List<Map<String, dynamic>> productsJson = [
  {
    'id': 'p1',
    'name': 'Anker Nano II 65W',
    'category': 'Chargers',
    'price': 39.99,
    'description':
        'A charger with a single USB-C port that can charge laptops like the MacBook Air M1, HP Spectre Folio or Dell XPS 13 just as easily as phones, tablets, wireless headphones or a Nintendo Switch.',
    'imageURL': 'https://m.media-amazon.com/images/I/61PRvw0FyDL.jpg'
  },
  {
    'id': 'p2',
    'name': 'MagSafe Charger',
    'category': 'Chargers',
    'price': 39.00,
    'description':
        'A useful accessory for iPhone 12 and later models that enables a wide variety of new accessories beyond simple charging options.',
    'imageURL':
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MHXH3?wid=1144&hei=1144&fmt=jpeg&qlt=95&.v=1604347427000'
  },
  {
    'id': 'p3',
    'name': 'OnePlus WarpCharger 65W',
    'category': 'Chargers',
    'price': 29.99,
    'description':
        'A fast charger for OnePlus devices that uses a unique dual-battery system to allow it to handle incredible charging speeds.',
    'imageURL':
        'https://oasis.opstatics.com/content/dam/oasis/page/product/accessories/case---protection/8t/warp-charge-65-power-adapter/na/warp65_A_US_small.jpg'
  },
  {
    'id': 'p4',
    'name': 'MATEIN Travel Laptop Backpack',
    'category': 'Backpacks',
    'price': 28.16,
    'description':
        'A business anti-theft slim durable laptop backpack with USB charging port that fits a 15.6 inch notebook.',
    'imageURL':
        'https://images-na.ssl-images-amazon.com/images/I/81mHL0psH-L._AC_SL1500_.jpg'
  },
  {
    'id': 'p5',
    'name': 'USB C Charger, Anker 511',
    'category': 'Chargers',
    'price': 10.99,
    'description':
        'A PIQ 3.0 durable compact fast charger for iPhone, Galaxy, Pixel, iPad and iPad mini (cable not included).',
    'imageURL': 'https://m.media-amazon.com/images/I/61AusAXfmSL.jpg'
  },
  {
    'id': 'p6',
    'name': 'SHRRADOO Extra Large Travel Laptop Backpack',
    'category': 'Backpacks',
    'price': 31.96,
    'description':
        'An extra large travel laptop backpack with USB charging port that fits a 17 inch laptop.',
    'imageURL':
        'https://images-na.ssl-images-amazon.com/images/I/81Z8NvO2TFL._AC_SL1500_.jpg'
  }
];
List<Product> products = List.from(
  productsJson.map(
    (
      e,
    ) =>
        Product(
      id: e['id'],
      name: e['name'],
      category:
          categories.firstWhere((category) => category.name == e['category']),
      description: e['description'],
      price: e['price'],
      imageUrl: e['imageURL'],
    ),
  ),
);

List<Category> categories = [
  Category(id: 'c1', name: 'Backpacks'),
  Category(id: 'c2', name: 'Chargers'),
  Category(id: 'c3', name: 'Laptops'),
];
