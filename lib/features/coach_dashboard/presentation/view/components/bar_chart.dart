import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

AspectRatio barChart() {
  return AspectRatio(
    aspectRatio: 1.5,
    child: BarChart(
      BarChartData(
        barGroups: [
          _buildBarData(0, 2000),
          _buildBarData(1, 3000),
          _buildBarData(2, 6000),
          _buildBarData(3, 4000),
          _buildBarData(4, 9000),
          _buildBarData(5, 5000),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final titles = ['w1', 'w2', 'w3', 'w4', 'w5', 'w6'];
                return Text(titles[value.toInt()]);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
      ),
    ),
  );
}

BarChartGroupData _buildBarData(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        width: 20,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.7),
            AppColors.primaryColor,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    ],
  );
}
