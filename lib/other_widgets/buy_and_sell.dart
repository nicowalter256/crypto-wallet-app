import 'package:flutter/material.dart';

class BuyAndSell extends StatefulWidget {
  const BuyAndSell({super.key});

  @override
  State<BuyAndSell> createState() => _BuyAndSellState();
}

class _BuyAndSellState extends State<BuyAndSell> {
  bool isFirstButtonActive = false;
  bool isSecondButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: 175,
            decoration: BoxDecoration(
              color: isFirstButtonActive
                  ? const Color.fromARGB(167, 34, 255, 159)
                  : const Color.fromARGB(161, 34, 255, 159),
              border: Border.all(
                color: isFirstButtonActive ? Colors.transparent : Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Buy',
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
            width: 175,
            decoration: BoxDecoration(
              color: isSecondButtonActive
                  ? const Color.fromARGB(255, 236, 35, 89)
                  : const Color.fromARGB(255, 236, 35, 89),
              border: Border.all(
                color: isSecondButtonActive ? Colors.transparent : Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Sell',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
