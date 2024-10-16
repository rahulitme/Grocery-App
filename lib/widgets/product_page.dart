import 'package:flutter/material.dart';
import 'product_card.dart'; // Ensure to import your ProductCard widget

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: 3,  // You can change this based on the number of products
        itemBuilder: (context, index) {
          return ProductCard(
            name: 'Product $index',
            price: 99.99 + index * 10,
            imagePath: 'assets/images/product_$index.jpg', imageUrl: '', onAddToCart: () {  },  // Ensure your images are named correctly in the assets folder
          );
        },
      ),
    );
  }
}
