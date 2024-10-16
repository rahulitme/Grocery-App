import 'package:flutter/material.dart';

class ClothesOfferPage extends StatelessWidget {
  const ClothesOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothes Offers'),
        backgroundColor:
            Colors.redAccent, // Updated AppBar color for clothes theme
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ElectronicsOfferCard(
            title: 'T-Shirts',
            image: 'assets/t1.jpeg',
            price: '₹999',
            discount: '20% Off',
            onTap: () {
              // Handle onTap for T-Shirts offer
            },
          ),
          ElectronicsOfferCard(
            title: 'Jeans',
            image: 'assets/j1.jpeg',
            price: '₹1,499',
            discount: '15% Off',
            onTap: () {
              // Handle onTap for Jeans offer
            },
          ),
          ElectronicsOfferCard(
            title: 'Shoes',
            image: 'assets/shoes.jpeg',
            price: '₹2,499',
            discount: '30% Off',
            onTap: () {
              // Handle onTap for Shoes offer
            },
          ),
          // Add more ElectronicsOfferCard widgets for other offers
        ],
      ),
    );
  }
}

class ElectronicsOfferCard extends StatelessWidget {
  final String title;
  final String image;
  final String? price; // Price is optional now
  final String? discount; // Discount is optional now
  final VoidCallback onTap;

  const ElectronicsOfferCard({
    super.key,
    required this.title,
    required this.image,
    this.price, // Optional parameter
    this.discount, // Optional parameter
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0, // Adds shadow for a 3D effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (price != null && discount != null) ...[
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: $price',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                        Text(
                          discount!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
