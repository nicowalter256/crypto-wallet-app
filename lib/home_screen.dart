import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  bool isFirstButtonActive = false; // State for the first button
  bool isSecondButtonActive = false; // State for the second button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 39, 55, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 20 px padding from scaffold
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Top Row with Menu Icon and Wallet Icon
            Row(
              children: const [
                Icon(Icons.menu, size: 30, color: Colors.white),
                Spacer(),
                Icon(Icons.account_balance_wallet, size: 30, color: Colors.white),
              ],
            ),

            const SizedBox(height: 20), // Spacing between the top row and PageView

            // Horizontal PageView to display 3 containers
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(108, 61, 255, 100),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Navigation Indicators
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 25 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color.fromRGBO(108, 61, 255, 100)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),

            // Row for the two buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // First Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFirstButtonActive = true;
                      isSecondButtonActive = false; // Set the second button inactive
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 180, // Set width for the first button
                    decoration: BoxDecoration(
                      color: isFirstButtonActive
                          ? const Color.fromRGBO(108, 61, 255, 100)
                          : Colors.transparent,
                      border: Border.all(
                        color: isFirstButtonActive
                            ? Colors.transparent
                            : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Deposit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),

                // Second Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSecondButtonActive = true;
                      isFirstButtonActive = false; // Set the first button inactive
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 180, // Set width for the second button
                    decoration: BoxDecoration(
                      color: isSecondButtonActive
                          ? const Color.fromRGBO(108, 61, 255, 100)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSecondButtonActive
                            ? Colors.transparent
                            : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Withdraw',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}





