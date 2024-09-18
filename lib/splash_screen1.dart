import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/splash_screen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  void _onGetStartedPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width to make it responsive
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
          // Foreground Content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.2),  // 20% of the screen height
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.35),
                height: screenHeight * 0.1, // Responsive height
                width: screenWidth * 0.2,   // Responsive width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent,  // Dark to Transparent
                      Colors.black.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset('assets/bitcoin.png'),
              ),
              SizedBox(height: screenHeight * 0.02),  // Spacing
              Container(
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,  // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'THE NEW WORLD FOR',
                      style: TextStyle(
                        fontSize: screenWidth * 0.09,   // Responsive font size
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'YOUR CRYPTO',
                      style: TextStyle(
                        fontSize: screenWidth * 0.09,   // Responsive font size
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: screenHeight * 0.25,  // Responsive height
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
                          'Explore Our Crypto World',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,  // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'You can buy and sell the NFT\'s of the',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,  // Responsive font size
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'best artists in the world.',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,  // Responsive font size
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: _onGetStartedPressed,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                            height: screenHeight * 0.06,  // Responsive button height
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Ink(
                              child: Center(
                                child: Text(
                                  'Get Started',
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
