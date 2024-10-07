import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/sign_up_screen.dart';
import 'package:crypto_wallet/login_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  void _onSignUpPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _onLogInPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen height and width for responsive layout
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // Background Image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/autumn.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.2),  // Adjusted for screen height
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.4),
                height: screenHeight * 0.1, // Responsive height
                width: screenWidth * 0.2,   // Responsive width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent,
                      Colors.black.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset('assets/bitcoin.png'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,  // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    InkWell(
                      onTap: _onLogInPressed,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        height: screenHeight * 0.06,  // Responsive button height
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Ink(
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,  // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,  // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    InkWell(
                      onTap: _onSignUpPressed,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        height: screenHeight * 0.06,  // Responsive button height
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Ink(
                          child: Center(
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,  // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: screenHeight * 0.2,  // Responsive height
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background blur effect
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Crypto news',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,  // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Explore Our Crypto World',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,  // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'You can buy and sell the NFT\'s of the',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,  // Responsive font size
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                'best artists in the world.',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,  // Responsive font size
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}
