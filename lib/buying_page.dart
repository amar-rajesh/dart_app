import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String image;
  final double price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductSelectionPage(),
    );
  }
}

class ProductSelectionPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Maize",
      image: "assets/maize.jpg",
      price: 10.99,
    ),
    Product(
      name: "Beans",
      image: "assets/beans.jpg",
      price: 8.99,
    ),
    Product(
      name: "Cassava",
      image: "assets/cassava.jpg",
      price: 7.99,
    ),
    Product(
      name: "Potatoes",
      image: "assets/potatoes.jpg",
      price: 6.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farm Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              products[index].image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(products[index].name),
            subtitle: Text("\$${products[index].price.toStringAsFixed(2)}"),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle Buy button press for this product
              },
              child: Text("Buy"),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle Home button press
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle Settings button press
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Handle Profile button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
