import 'package:flutter/material.dart';

class ElectronicsOffersPage extends StatelessWidget {
  const ElectronicsOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics Offers'),
        backgroundColor: Colors.blueAccent, // Updated AppBar color
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ElectronicsOfferCard(
            title: 'led',
            image: 'assets/electronics.jpeg',
            price: '₹100-2000',
            discount: '10% Off',
            onTap: () {
              // Handle onTap for smartphones offer
            },
          ),
          ElectronicsOfferCard(
            title: 'mobile',
            image: 'assets/e3.jpeg',
            price: '₹69,999',
            discount: '15% Off',
            onTap: () {
              // Handle onTap for laptops offer
            },
          ),
          ElectronicsOfferCard(
            title: 'Headphones',
            image: 'assets/h1.jpeg',
            price: '₹5,999',
            discount: '20% Off',
            onTap: () {
              // Handle onTap for headphones offer
            },
          ),
          ElectronicsOfferCard(
            title: 'Smartwatches',
            image: 'assets/s1.jpeg',
            price: '₹14,999',
            discount: '5% Off',
            onTap: () {
              // Handle onTap for smartwatches offer
            },
          ),
        ],
      ),
    );
  }
}

class ElectronicsOfferCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String discount;
  final VoidCallback onTap;

  const ElectronicsOfferCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
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
                        discount,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
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
