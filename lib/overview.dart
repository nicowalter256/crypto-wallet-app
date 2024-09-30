import 'package:flutter/material.dart';
import './tabviews/general_tab.dart';
import './tabviews/transaction_tab.dart';
import './tabviews/analytics_tab.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<Color> portfolioGradientColors = [
    const Color.fromRGBO(49, 56, 74, 1),
    const Color.fromARGB(255, 32, 39, 55),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 39, 55),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_new),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Overview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: portfolioGradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.currency_exchange_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: portfolioGradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TabBar(
                tabs: [
                  Tab(text: 'General'),
                  Tab(text: 'Transactions'),
                  Tab(text: 'Analytics'),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
                indicatorColor: Colors.white,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  GeneralTab(),
                  TransactionTab(),
                  AnalyticsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
