import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 39, 55, 1),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(
                    Icons.menu, size: 30, color: Colors.white
                ),
                Spacer(),
                Icon(
                    Icons.account_balance_wallet, size: 30, color: Colors.white
                ),
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
                      ? const Color.fromRGBO(108, 61, 255, 100)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),

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
                        ? const Color.fromRGBO(108, 61, 255, 100)
                        : Colors.transparent,
                    border: Border.all(
                      color: isFirstButtonActive ? Colors.transparent : Colors.grey,
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
                        ? const Color.fromRGBO(108, 61, 255, 100)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSecondButtonActive ? Colors.transparent : Colors.grey,
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
          const SizedBox(height: 30),

          // Line Chart
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 12,
                    top: 24,
                    bottom: 12,
                  ),
                  child: LineChart(
                    showAvg ? avgData() : mainData(),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: SizedBox(
                  width: 60,
                  height: 34,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAvg = !showAvg;
                      });
                    },
                    child: Text(
                      'avg',
                      style: TextStyle(
                        fontSize: 12,
                        color: showAvg
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),


      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
