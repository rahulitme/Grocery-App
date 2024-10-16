// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:myapp/screens/otp_screen.dart';
// import 'package:myapp/screens/profile_screen.dart';
// import 'package:myapp/screens/login_screen.dart';
// import 'package:myapp/screens/signup_screen.dart';
// import 'package:myapp/screens/landing_page.dart';
// import 'package:myapp/screens/signup_with_google.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//   } catch (e) {
//     if (kDebugMode) {
//       print("Error initializing Firebase: $e");
//     }
//   }

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       themeMode: ThemeMode.system,
//       initialRoute:
//           FirebaseAuth.instance.currentUser == null ? '/login' : '/profile',
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/otp': (context) => const EmailOTPScreen(),
//         '/signup': (context) => const SignUpScreen(),
//         '/SignupWithGoogle': (context) =>
//             const SignupWithGoogle(), // Ensure correct case
//         '/profile': (context) => const ProfileScreen(),
//         '/ProductDetailsPag': (context) => const ProfileScreen(),
//         '/landing': (context) {
//           final user = FirebaseAuth.instance.currentUser;
//           return LandingPage(
//               user: user!); // Assuming user will not be null here
//          },
//         // Add the HomeScreen route if necessary
//         // '/home': (context) => const HomeScreen(),
//       },
//     );
//   }
// }


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/product_details_page.dart';
import 'package:myapp/screens/otp_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/landing_page.dart';
import 'package:myapp/screens/signup_with_google.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    if (kDebugMode) {
      print("Error initializing Firebase: $e");
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/profile',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const EmailOTPScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/SignupWithGoogle': (context) => const SignupWithGoogle(),
        '/profile': (context) => const ProfileScreen(),
        '/ProductDetailsPag': (context) => const ProductDetailsPage(title: '', imagePath: '', price: '', discount: '',),
        '/landing': (context) {
          final user = FirebaseAuth.instance.currentUser;
          return LandingPage(user: user!);
        },
        // Adding the route for HomeScreen with ProductGrid
        
      },
    );
  }
}




