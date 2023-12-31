import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShopScreen(),
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Promosi'),
              Tab(text: 'Nama Produk (A-Z)'),
              Tab(text: 'Terlaris'),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Semua Produk',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 60.0, 
                ),
                itemCount: 4, 
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard('Product ${index + 1}', 'assets/product${index + 1}.jpg');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String productName;
  final String assetName;

  ProductCard(this.productName, this.assetName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, 
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              assetName,
              fit: BoxFit.cover,
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productName,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('+ Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
