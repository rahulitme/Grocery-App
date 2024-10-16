// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final String name;
//   final double price;
//   final String imageUrl;

//   const ProductCard({super.key, required this.name, required this.price, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           Image.network(imageUrl, height: 10, fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(name, style: Theme.of(context).textTheme.titleMedium),
//           ),
//           Text('\$${price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleSmall),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imagePath;  // Local asset path

  const ProductCard({super.key, required this.name, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, height: 140, fit: BoxFit.cover),  // Load local asset image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: Theme.of(context).textTheme.titleMedium),
          ),
          Text('\$${price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
