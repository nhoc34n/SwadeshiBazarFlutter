import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swadeshi_bazar/splash_screen.dart';
import 'package:swadeshi_bazar/welcome_screen.dart';
import 'package:swadeshi_bazar/login_screen.dart';
import 'package:swadeshi_bazar/signup_screen.dart';
import 'package:swadeshi_bazar/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(); // Initialize Firebase
    runApp(MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swadeshi Bazar',
      theme: ThemeData(
        primarySwatch: Colors.green, // Define a primary swatch color
        // If you need to define a specific color (not a swatch), you can use:
        // primaryColor: Color(0xFF199B33), // Your specific color code
      ),
      initialRoute: '/', // Initial route set to SplashScreen
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
