import 'package:flutter/material.dart';
import './flcharts/line_chart_sample2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  bool isFirstButtonActive = false;
  bool isSecondButtonActive = false;
  bool showAvg = false; // State for showing average data in chart
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // Dropdown items
  final List<String> items = [
    'Smart Chain BEP - 20',
    'Smart Chain GUY -21',
    'Ethereum - 30'
  ];
  String? selectedItem = 'Smart Chain BEP - 20'; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 39, 55, 1),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(Icons.account_balance_wallet,
                    size: 30, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Horizontal PageView to display 3 containers
          SizedBox(
            height: 150,
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
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color.fromRGBO(76, 27, 181, 100),
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                      color: const Color.fromARGB(255, 71, 74, 255),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'CURRENT WALLET BALANCE',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            '\$3,293.6',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.5,
                            ),
                          ),
                          // DropdownButton with decoration
                          Container(
                            margin: const EdgeInsets.only(right: 140),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white, // White outline
                                width: 1, // 1px border width
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedItem,
                              hint: const Text(
                                'Smart Chain BEP - 20',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              dropdownColor:
                                  const Color.fromARGB(255, 71, 74, 255),
                              items: items.map(
                                (String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                });
                              },
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              ),
                              underline:
                                  Container(), // Removes the default underline
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Navigation Indicators
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 25 : 10,
                height: 6,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color.fromARGB(255, 71, 74, 255)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Two Buttons (Deposit, Withdraw)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstButtonActive = true;
                    isSecondButtonActive = false;
                  });
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: isFirstButtonActive
                        ? const Color.fromARGB(255, 71, 74, 255)
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSecondButtonActive = true;
                    isFirstButtonActive = false;
                  });
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: isSecondButtonActive
                        ? const Color.fromARGB(255, 71, 74, 255)
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const LineChartSample2(),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Portfolio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
