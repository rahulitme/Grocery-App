// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart'; // For engaging animations

// class LandingPage extends StatelessWidget {
//   final User user;

//   const LandingPage({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Hero Section
//             Stack(
//               children: [
//                 Container(
//                   height: 300,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.purple, Colors.orange],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   top: 100,
//                   left: 20,
//                   child: Text(
//                     "Diwali Offers!",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 160,
//                   left: 20,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigate to Offers Page
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text("Explore Now"),
//                   ),
//                 ),
//                 // Animated graphics (e.g., Diwali theme using Lottie)
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Lottie.asset(
//                     'assets/diwali_lamp.json', // Add your Lottie file
//                     height: 150,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Product Categories Section
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 "Featured Categories",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildCategoryCard("Electronics", "assets/electronics.jpeg"),
//                   _buildCategoryCard("Fashion", "assets/fashion.jpeg"),
//                   _buildCategoryCard("Home Decor", "assets/home_decor.jpeg"),
//                 ],
//               ),
//             ),

//             // Featured Items Section
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 "Featured Items",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 _buildFeaturedItem(
//                     "Smartphone", "assets/smartphone.jpeg", "50% off"),
//                 _buildFeaturedItem(
//                     "Smartwatch", "assets/smartwatch.jpeg", "30% off"),
//                 _buildFeaturedItem("Sofa", "assets/sofa.jpeg", "20% off"),
//                 _buildFeaturedItem("Shoes", "assets/shoes.jpeg", "40% off"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String category, String imagePath) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 150,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             category,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               backgroundColor: Colors.black45,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeaturedItem(String title, String imagePath, String discount) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       child: Column(
//         children: [
//           Image.asset(imagePath, height: 100, fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Text(discount, style: const TextStyle(color: Colors.red)),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/%20package/myapp/lib/scrren/electronics_offers_page.dart';
import 'package:myapp/screens/package/clothes.dart';

class LandingPage extends StatefulWidget {
  final User user;

  const LandingPage({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  Duration _timeLeft = const Duration(hours: 24);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft.inSeconds > 0) {
          _timeLeft = _timeLeft - const Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeroSection(),
          _buildFestiveBonanzaSection(),
          _buildCategoriesSection(),
          _buildFeaturedItemsSection(),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Diwali Offers!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 222, 222),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClothesOfferPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Shop Now", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFestiveBonanzaSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade100, Colors.orange.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Festive Bonanza!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 241, 233, 230),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Up to 50% off on electronics",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElectronicsOffersPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 248, 241, 238),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Shop Now", style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Ends in: ${formatDuration(_timeLeft)}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Featured Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildCategoryCard("Electronics", "assets/electronics.jpeg"),
              _buildCategoryCard("Fashion", "assets/fashion.jpeg"),
              _buildCategoryCard("Home Decor", "assets/home_decor.jpeg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String category, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "Featured Items",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: [
            _buildFeaturedItem(
                "Smartphone", "assets/smartphone.jpeg", "50% off"),
            _buildFeaturedItem(
                "Smartwatch", "assets/smartwatch.jpeg", "30% off"),
            _buildFeaturedItem("Sofa", "assets/sofa.jpeg", "20% off"),
            _buildFeaturedItem("Shoes", "assets/shoes.jpeg", "40% off"),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedItem(String title, String imagePath, String discount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imagePath, fit: BoxFit.cover, height: 120),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 4),
                Text(discount, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lottie/lottie.dart';
// import 'package:myapp/widgets/%20profile_card.dart';

// // import 'package/myapp/lib/widgets/offer_card.dart';
// import 'package:myapp/widgets/cart_card.dart';
// import 'package:myapp/widgets/product_card.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'E-commerce App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: FutureBuilder<User?>(
//         future: FirebaseAuth.instance.authStateChanges().first,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           }
//           if (snapshot.hasData && snapshot.data != null) {
//             return LandingPage(user: snapshot.data!);
//           }
//           return const LoginPage();
//         },
//       ),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: const Center(child: Text('Login page placeholder')),
//     );
//   }
// }

// class LandingPage extends StatefulWidget {
//   final User user;

//   const LandingPage({super.key, required this.user});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LandingPageState createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _getPage(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_offer),
//             label: 'Offers',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.grid_view),
//             label: 'Products',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return const OffersPage();
//       case 1:
//         return const ProductsPage();
//       case 2:
//         return const CartPage();
//       case 3:
//         return ProfilePage(user: widget.user);
//       default:
//         return const OffersPage();
//     }
//   }

//   void _onItemTapped(int index) {
//     if (index == 1) {
//       // Products page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProductsPage()),
//       );
//     } else if (index == 2) {
//       // Cart page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const CartPage()),
//       );
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }
// }

// class OffersPage extends StatefulWidget {
//   const OffersPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _OffersPageState createState() => _OffersPageState();
// }

// class _OffersPageState extends State<OffersPage> {
//   late Timer _timer;
//   Duration _timeLeft = const Duration(hours: 24);

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_timeLeft.inSeconds > 0) {
//           _timeLeft = _timeLeft - const Duration(seconds: 1);
//         } else {
//           _timer.cancel();
//         }
//       });
//     });
//   }

//   String formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String hours = twoDigits(duration.inHours.remainder(24));
//     String minutes = twoDigits(duration.inMinutes.remainder(60));
//     String seconds = twoDigits(duration.inSeconds.remainder(60));
//     return "$hours:$minutes:$seconds";
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Hero Section
//           Stack(
//             children: [
//               Container(
//                 height: 300,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.purple, Colors.orange],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 top: 100,
//                 left: 20,
//                 child: Text(
//                   "Diwali Offers!",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 160,
//                 left: 20,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Navigate to Offers Page
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text("Explore Now"),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: Lottie.asset(
//                   'assets/diwali_lamp.json',
//                   height: 150,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),

//           // Festive Bonanza Section
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             color: Colors.orange[100],
//             child: Column(
//               children: [
//                 const Text(
//                   "Festive Bonanza!",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text("Up to 50% off on electronics"),
//                 const SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigate to Electronics Offers
//                   },
//                   child: const Text("Shop Now"),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   "Offers end in: ${formatDuration(_timeLeft)}",
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Product Categories Section
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Featured Categories",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 200,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildCategoryCard("Electronics", "assets/electronics.jpeg"),
//                 _buildCategoryCard("Fashion", "assets/fashion.jpeg"),
//                 _buildCategoryCard("Home Decor", "assets/home_decor.jpeg"),
//               ],
//             ),
//           ),

//           // Featured Items Section
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Featured Items",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             children: [
//               _buildFeaturedItem("Smartphone", "assets/smartphone.jpeg", "50% off"),
//               _buildFeaturedItem("Smartwatch", "assets/smartwatch.jpeg", "30% off"),
//               _buildFeaturedItem("Sofa", "assets/sofa.jpeg", "20% off"),
//               _buildFeaturedItem("Shoes", "assets/shoes.jpeg", "40% off"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String category, String imagePath) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 150,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             category,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               backgroundColor: Colors.black45,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeaturedItem(String title, String imagePath, String discount) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       child: Column(
//         children: [
//           Image.asset(imagePath, height: 100, fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Text(discount, style: const TextStyle(color: Colors.red)),
//         ],
//       ),
//     );
//   }
// }
// class ProductsPage extends StatelessWidget {
//   const ProductsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Products'),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.75,
//         ),
//         itemBuilder: (context, index) {
//           return ProductCard(name: '', price:0.0, imageUrl: '', onAddToCart: () {  }, imagePath: '',); // Using the imported ProductCard widget
//         },
//       ),
//     );
//   }
// }

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: 10, // Add itemCount or other data here
//         itemBuilder: (context, index) {
//           return CartCard(productName: 'Product $index', price: 0.0); // Provide a default price
//         },
//       ),
//     );
//   }
// }


// class ProfilePage extends StatelessWidget {
//   final User user;

//   const ProfilePage({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ProfileCard(user: user, name: '', email: '',), // Using the imported ProfileCard widget
//     );
//   }
// }