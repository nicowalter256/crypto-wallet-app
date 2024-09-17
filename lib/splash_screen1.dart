import 'dart:ui';

import 'package:crypto_wallet/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/splash_screen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  void _onGetStartedPressed(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SplashScreen2()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Container(
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
                const SizedBox(height: 150),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 160),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orangeAccent,               // Dark to Transparent
                        Colors.black.withOpacity(0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset('assets/bitcoin.png'),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.zero,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME TO',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'THE NEW WORLD FOR',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'YOUR CRYPTO',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  height: 200,
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
                              color: Colors.black.withOpacity(0.2),  // Adjust the color and opacity
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Explore Our Crypto World',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Column(
                            children: [
                              Text(
                                'You can buy and sell the NFT\'s of the',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'best artists in the world.',
                                style: TextStyle(
                                  fontSize: 15,
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
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Ink(
                                child: const Center(
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 17,
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
