import 'package:flutter/material.dart';



class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 160),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(40),
              ),
              child:  Image.asset('assets/bitcoin.png',),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('WELCOME TO', style:
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                  Text('THE NEW WORLD FOR',
                    style:
                    TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text('YOUR CRYPTO',
                    style:
                    TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 45, 75, 20),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Explore Our Crypto World',
                    style:
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text('You can buy and sell the NFT\'s of the',
                        style:
                        TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Text('best artists in the world.',
                        style:
                        TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Ink(
                      child: Center(
                        child: Text('Get Started',
                          style:
                          TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ),


                  )

                ],
              ),
            )

          ],
        )
    );
  }
}
