import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat', // Set custom font family
      ),
      home: SplashScreen(), // Display splash screen initially
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate loading delay with Future.delayed
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display your image using Image.network
            Image.network(
              'https://www.logolynx.com/images/logolynx/a6/a671ef222a6e136f8fe7fd9cfc97e57b.png',
              width: 200, // Set the desired width
              height: 200, // Set the desired height
              fit: BoxFit.contain, // Adjust the image size
            ),
            SizedBox(height: 20), // Add spacing below the image
            Text(
              'Welcome to sec9 Store!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECommerce App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Explore Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
              child: Text('View Products'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      '1',
      'Smartphone',
      'Latest model smartphone with advanced features',
      799.99,
      'https://pngimg.com/uploads/smartphone/smartphone_PNG8514.png', // Sample image URL
      4.5,
    ),
    Product(
      '2',
      'Laptop',
      'High-performance laptop for work and entertainment',
      1299.99,
      'https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg', // Sample image URL
      4.2,
    ),
    Product(
      '3',
      'Headphones',
      'Wireless headphones with noise-cancelling technology',
      249.99,
      'http://www.bhphotovideo.com/images/images2500x2500/beats_by_dr_dre_900_00198_01_studio_wireless_headphones_matte_1016367.jpg', // Sample image URL
      4.0,
    ),
    Product(
      '4',
      'Smartwatch',
      'Fitness tracker smartwatch with heart rate monitor',
      199.99,
      'https://www.amazon.in/images/I/6113mS%2BxhyL._SL1500_.jpg', // Sample image URL
      4.1,
    ),
    Product(
      '5',
      'Speaker System',
      'High-fidelity speaker system for home audio',
      499.99,
      'https://www.technoven.com/wp-content/uploads/2019/02/speaker-1024x894.png', // Sample image URL
      4.3,
    ),
    Product(
      '6',
      'Camera',
      'Professional DSLR camera with high-resolution sensor',
      1499.99,
      'http://www.bhphotovideo.com/images/images2500x2500/canon_1263c005_eos_80d_dslr_camera_1225876.jpg', // Sample image URL
      4.8,
    ),
    Product(
      '7',
      'Tablet',
      'Slim and lightweight tablet for on-the-go productivity',
      499.99,
      'https://i.channeldailynews.com/wp-content/uploads/2017/02/03_Samsung-TabS3_Dynamic-Pen_Silver_WIFI_HR.jpg', // Sample image URL
      4.4,
    ),
    Product(
      '8',
      'Gaming Console',
      'Next-gen gaming console for immersive gaming experience',
      399.99,
      'https://elcytec.com/wp-content/uploads/2021/07/ps4-pro-image-block-01-en-24jul20.png', // Sample image URL
      4.6,
    ),
    Product(
      '9',
      'Wireless Earbuds',
      'Compact and stylish wireless earbuds for music lovers',
      129.99,
      'https://images-na.ssl-images-amazon.com/images/I/71apwE6HGaL._AC_SL1500_.jpg', // Sample image URL
      4.3,
    ),
    Product(
      '10',
      'External SSD',
      'High-speed external SSD for storing and transferring data',
      199.99,
      'https://m.media-amazon.com/images/I/71FZsdw50bL._AC_SL1499_.jpg', // Sample image URL
      4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(products[index]);
        },
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;

  Product(
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.rating,
  );
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ShoppingCart.addProduct(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added to Cart: ${product.name}'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCart {
  static List<Product> _cartItems = [];

  static void addProduct(Product product) {
    _cartItems.add(product);
  }

  static List<Product> getCartItems() {
    return List.from(_cartItems); // Return a copy to avoid direct mutation
  }
}
