import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/login_screen.dart';
import 'package:crypto_wallet/splash_screen2.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Navigation Functions
  void _navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _navigateToSplashScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/stars.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main Content
          Column(
            children: [
              // Header with Back Button and Title
              Container(
                margin: const EdgeInsets.only(top: 80, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _navigateToSplashScreen,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Create your free account',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Bitcoin Logo
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orangeAccent,
                        Colors.black.withOpacity(0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset('assets/bitcoin.png'),
                ),
              ),
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 350,
                    child: Stack(
                      children: [
                        // Background Blur
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Google Sign-Up Button
                            _buildSocialButton(
                              onTap: _navigateToHomeScreen,
                              asset: 'assets/google.png',
                              label: 'Continue with Google',
                            ),
                            // Facebook Sign-Up Butto
                            _buildSocialButton(
                              onTap: _navigateToHomeScreen,
                              asset: 'assets/facebook.png',
                              label: 'Continue with Facebook',
                            ),
                            // Microsoft Sign-Up Button
                            _buildSocialButton(
                              onTap: _navigateToHomeScreen,
                              asset: 'assets/microsoft.png',
                              label: 'Continue with Microsoft',
                            ),
                            // Login Prompt
                            InkWell(
                              onTap: _navigateToLoginScreen,
                              child: const Center(
                                child: Text(
                                  'Already have an account, login',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Footer
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Explore Our Crypto World',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white38,
                      ),
                    ),
                    Text(
                      'You can buy and sell the NFT\'s of the',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white38,
                      ),
                    ),
                    Center(
                      child: Text(
                        'best artists in the world.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Social Button Builder
  Widget _buildSocialButton({required VoidCallback onTap, required String asset, required String label}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, height: 25),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
