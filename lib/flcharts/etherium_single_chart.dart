import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EthereumSingleChart extends StatelessWidget {
  const EthereumSingleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: LineChart(ethereumData()),
            ),
            Positioned(
              top: 15,
              left: 20,
              child: Text(
                'Ethereum',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.transparent,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'ETH',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.transparent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '\$3,245.65',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.transparent,
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
      maxX: 9,
      minY: 0,
      maxY: 5,
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
              const Color.fromARGB(255, 34, 255, 159),
              Color.fromRGBO(32, 39, 55, 1).withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(82, 34, 255, 159),
                Color.fromRGBO(32, 39, 55, 1).withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
