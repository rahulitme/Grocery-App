import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupWithGoogle extends StatefulWidget {
  const SignupWithGoogle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupWithGoogleState createState() => _SignupWithGoogleState();
}

class _SignupWithGoogleState extends State<SignupWithGoogle> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isSigningIn = false;

  Future<User?> _signInWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        setState(() {
          _isSigningIn = false;
        });
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      setState(() {
        _isSigningIn = false;
      });

      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        _isSigningIn = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup with Google'),
      ),
      body: Center(
        child: _isSigningIn
            ? const CircularProgressIndicator()
            : ElevatedButton.icon(
                icon: Image.asset('assets/cover.png', height: 24.0),
                label: const Text('Sign up with Google'),
                onPressed: () async {
                  User? user = await _signInWithGoogle();
                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Signed in as ${user.displayName}'),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myapp/screens/landing_page.dart';

// // Assuming you have a LandingPage widget defined somewhere in your project // Adjust the import according to your file structure

// class SignupWithGoogle extends StatefulWidget {
//   const SignupWithGoogle({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SignupWithGoogleState createState() => _SignupWithGoogleState();
// }

// class _SignupWithGoogleState extends State<SignupWithGoogle> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   bool _isSigningIn = false;

//   Future<User?> _signInWithGoogle() async {
//     setState(() {
//       _isSigningIn = true;
//     });

//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         setState(() {
//           _isSigningIn = false;
//         });
//         return null;
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential = await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;

//       setState(() {
//         _isSigningIn = false;
//       });

//       return user;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       setState(() {
//         _isSigningIn = false;
//       });
//       return null;
//     }
//   }

//   void _handleUserSignIn(User? user) {
//     if (user != null) {
//       // Show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Signed in as ${user.displayName}'),
//         ),
//       );

//       // Check if the user is new
//       if (user.metadata.creationTime != null && user.metadata.lastSignInTime != null &&
//           user.metadata.creationTime!.isAtSameMomentAs(user.metadata.lastSignInTime!)) {
//         // This is a new user
//         // Show some options or a welcome message
//         _showWelcomeDialog();
//       } else {
//         // Existing user, navigate to the landing page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LandingPage()), // Replace with your landing page widget
//         );
//       }
//     }
//   }

//   void _showWelcomeDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Welcome!'),
//           content: const Text('Thank you for signing up! Explore the app!'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Continue'),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LandingPage()), // Replace with your landing page widget
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Signup with Google'),
//       ),
//       body: Center(
//         child: _isSigningIn
//             ? const CircularProgressIndicator()
//             : ElevatedButton.icon(
//                 icon: Image.asset('assets/cover.png', height: 24.0),
//                 label: const Text('Sign up with Google'),
//                 onPressed: () async {
//                   User? user = await _signInWithGoogle();
//                   _handleUserSignIn(user);
//                 },
//               ),
//       ),
//     );
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myapp/screens/%20ExistingEmailSignup.dart';
// import 'package:myapp/screens/landing_page.dart';

// class SignupWithGoogle extends StatefulWidget {
//   const SignupWithGoogle({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SignupWithGoogleState createState() => _SignupWithGoogleState();
// }

// class _SignupWithGoogleState extends State<SignupWithGoogle> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   bool _isSigningIn = false;

//   Future<User?> _signInWithGoogle() async {
//     setState(() {
//       _isSigningIn = true;
//     });

//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         setState(() {
//           _isSigningIn = false;
//         });
//         return null;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;

//       setState(() {
//         _isSigningIn = false;
//       });

//       return user;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       setState(() {
//         _isSigningIn = false;
//       });
//       return null;
//     }
//   }

//   void _handleUserSignIn(User? user) {
//     if (user != null) {
//       // Handle user sign-in logic
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Signed in as ${user.displayName}'),
//         ),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 const LandingPage()), // Replace with your landing page widget
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Signup with Google'),
//       ),
//       body: Center(
//         child: _isSigningIn
//             ? const CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton.icon(
//                     icon: Image.asset('assets/cover.png', height: 24.0),
//                     label: const Text('Sign up with Google'),
//                     onPressed: () async {
//                       User? user = await _signInWithGoogle();
//                       _handleUserSignIn(user);
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to Existing Email Signup Screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ExistingEmailSignup()),
//                       );
//                     },
//                     child: const Text('Use your existing email'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
