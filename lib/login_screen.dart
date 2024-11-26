import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedUserType = 'Farmer'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF9EE), // Background colour
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image
            Stack(
              children: [
                Image.asset(
                  'assets/top_background1.png', // Replace with your background image path
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 32,
                  bottom: 30,
                  child: Text(
                    'Welcome\nBack',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF199B33),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Sign In Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Sign in as...',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF199B33),
                ),
              ),
            ),
            // Radio Buttons for User Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centres the content horizontally
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Farmer',
                        groupValue: _selectedUserType,
                        onChanged: (value) {
                          setState(() {
                            _selectedUserType = value!;
                          });
                        },
                        activeColor: Color(0xFF199B33),
                      ),
                      Text(
                        'Farmer',
                        style: TextStyle(color: Color(0xFF199B33)),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 20), // Adds spacing between the two radio buttons
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Consumer',
                        groupValue: _selectedUserType,
                        onChanged: (value) {
                          setState(() {
                            _selectedUserType = value!;
                          });
                        },
                        activeColor: Color(0xFF199B33),
                      ),
                      Text(
                        'Consumer',
                        style: TextStyle(color: Color(0xFF199B33)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Email Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Color(0xFF199B33)),
                  hintStyle: TextStyle(color: Color(0xFF199B33)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF199B33)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF199B33)),
                  ),
                ),
                style: TextStyle(color: Color(0xFF199B33)),
              ),
            ),
            SizedBox(height: 16),
            // Password Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF199B33)),
                  hintStyle: TextStyle(color: Color(0xFF199B33)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF199B33)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF199B33)),
                  ),
                ),
                style: TextStyle(color: Color(0xFF199B33)),
              ),
            ),
            SizedBox(height: 20),
            // Login Button
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login action based on selected user type
                    print('Selected User Type: $_selectedUserType');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color(0xFF199B33),
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Register Text
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Are you a new user? ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF199B33),
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF199B33),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, '/signup'); // Navigate to signup page
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
