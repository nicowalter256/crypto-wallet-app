import 'dart:ui';

import 'package:flutter/material.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Text(
                      'Already have an account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
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
                              'Login',
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
                    SizedBox(height: 20),


                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
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
                              'SignUp',
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
              ),
              Spacer(),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: 140,
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
                        Text(
                          'Crypto news',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                       Text(
                          'Explore Our Crypto World',
                          style: TextStyle(
                            fontSize: 16,
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
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                'best artists in the world.',
                                style: TextStyle(
                                  fontSize: 15,
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
