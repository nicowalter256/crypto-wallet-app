import 'package:crypto_wallet/other_widgets/buy_and_sell.dart';
import 'package:flutter/material.dart';
import '../flcharts/etherium_single_chart.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  int _currentPage = 0;
  bool isFirstButtonActive = false;
  bool isSecondButtonActive = false;
  bool isThirdButtonActive = false;
  bool isFourthButtonActive = false;
  bool isFifthButtonActive = false;

  List<Color> portfolioGradientColors = [
    const Color.fromRGBO(49, 56, 74, 1),
    const Color.fromARGB(255, 32, 39, 55),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 39, 55),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    gradient: LinearGradient(
                      colors: portfolioGradientColors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Container(
                    height: 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // color: Colors.red,
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/bitcoin.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'CURRENT WALET BALANCE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '\$3,293.6',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //margin: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: portfolioGradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  //border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(40),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFirstButtonActive = true;
                          isSecondButtonActive = false;
                          isThirdButtonActive = false;
                          isFourthButtonActive = false;
                          isFifthButtonActive = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isFirstButtonActive
                              ? const Color.fromRGBO(107, 58, 255, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: isFirstButtonActive
                                ? Colors.transparent
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '1D',
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
                          isFirstButtonActive = false;
                          isSecondButtonActive = true;
                          isThirdButtonActive = false;
                          isFourthButtonActive = false;
                          isFifthButtonActive = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isSecondButtonActive
                              ? const Color.fromRGBO(107, 58, 255, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: isSecondButtonActive
                                ? Colors.transparent
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '1W',
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
                          isFirstButtonActive = false;
                          isSecondButtonActive = false;
                          isThirdButtonActive = true;
                          isFourthButtonActive = false;
                          isFifthButtonActive = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isThirdButtonActive
                              ? const Color.fromRGBO(107, 58, 255, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: isThirdButtonActive
                                ? Colors.transparent
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '1M',
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
                          isFirstButtonActive = false;
                          isSecondButtonActive = false;
                          isThirdButtonActive = false;
                          isFourthButtonActive = true;
                          isFifthButtonActive = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isFourthButtonActive
                              ? const Color.fromRGBO(107, 58, 255, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: isFourthButtonActive
                                ? Colors.transparent
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '1Y',
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
                          isSecondButtonActive = false;
                          isFirstButtonActive = false;
                          isThirdButtonActive = false;
                          isFourthButtonActive = false;
                          isFifthButtonActive = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isFifthButtonActive
                              ? const Color.fromRGBO(107, 58, 255, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: isFifthButtonActive
                                ? Colors.transparent
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              EthereumSingleChart(),
              BuyAndSell(),
            ],
          ),
        ),
      ),
    );
  }
}
