// ignore_for_file: prefer_const_constructors
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> bitcoinGradientColors = [
    Color.fromARGB(255, 34, 255, 159),
    Color.fromRGBO(32, 39, 55, 1),
  ];
  List<Color> ethereumgradientColors = [
    Color.fromRGBO(234, 80, 90, 1),
    Color.fromRGBO(32, 39, 55, 1),
  ];

  bool showAvg = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChartCard(
            context,
            'BitCoin',
            '+12.62%',
            'assets/bitcoin.png',
            '\$43,114.57',
            mainData(), // Pass the mainData for Bitcoin chart
          ),
          _buildChartCard(
            context,
            'Ethereum',
            '+5.87%',
            'assets/etherium.png',
            '\$3,245.65',
            ethereumData(), // Pass the ethereumData for Ethereum chart
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(
      BuildContext context,
      String title,
      String percentChange,
      String assetPath,
      String price,
      LineChartData chartData) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: LineChart(chartData),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  percentChange,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 34, 255, 159),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 20,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Image.asset(assetPath),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title == 'BitCoin' ? 'BTC' : 'ETH',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(97, 105, 117, 100),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Line chart data for Bitcoin
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
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
            colors: bitcoinGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: bitcoinGradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  // Line chart data for Ethereum
  LineChartData ethereumData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(2.6, 3.5),
            FlSpot(4.9, 4),
            FlSpot(6.8, 3),
            FlSpot(8, 2.5),
            FlSpot(9.5, 3),
            FlSpot(11, 4.5),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ethereumgradientColors[0].withOpacity(1),
              ethereumgradientColors[1].withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: ethereumgradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
