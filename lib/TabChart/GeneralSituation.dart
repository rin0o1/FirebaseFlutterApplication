

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {




  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        color: Colors.white10,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                    ) {
                  return BarTooltipItem(
                    100.toString(),
                    TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14, ),
                margin: 10,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'G';
                    case 1:
                      return 'F';
                    case 2:
                      return 'M';
                    case 3:
                      return 'A';
                    case 4:
                      return 'M';
                    case 5:
                      return 'G';
                    case 6:
                      return 'L';
                    case 7:
                      return 'A';
                    case 8:
                      return 'S';
                    case 9:
                      return 'O';
                    case 10:
                      return 'N';
                    case 11:
                      return 'D';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(y: 11, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(y: 14, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(y: 15, color: Colors.orangeAccent)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(y: 13, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 10, color: Colors.green)],
                  showingTooltipIndicators: [0]),
            ],
          ),

        ),
      ),
    );
  }

  /*Future<dynamic> refreshState() async {
    setState(() {

    });
    await Future<dynamic>.delayed(animDuration + const Duration(milliseconds: 50));
    if (true) {
      refreshState();
    }
  }*/


}



