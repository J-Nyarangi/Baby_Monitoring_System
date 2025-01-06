import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EnvironmentalMonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Environmental Monitoring'),
        backgroundColor: Colors.pink[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Temperature and Humidity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return const FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return const FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            String text;
                            switch (value.toInt()) {
                              case 0:
                                text = '00:00';
                                break;
                              case 1:
                                text = '06:00';
                                break;
                              case 2:
                                text = '12:00';
                                break;
                              case 3:
                                text = '18:00';
                                break;
                              default:
                                return Container();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(text, style: style),
                            );
                          },
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 2,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text('${value.toInt()}°C', style: style),
                            );
                          },
                          reservedSize: 40,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey),
                    ),
                    minX: 0,
                    maxX: 3,
                    minY: 20,
                    maxY: 30,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 22),
                          FlSpot(1, 25),
                          FlSpot(2, 23),
                          FlSpot(3, 28),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent],
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchCallback:
                          (FlTouchEvent event, LineTouchResponse? touchResponse) {},
                      handleBuiltInTouches: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Air Quality',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 300,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      verticalInterval: 1,
                      horizontalInterval: 10,
                      getDrawingVerticalLine: (value) {
                        return const FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingHorizontalLine: (value) {
                        return const FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            String text;
                            switch (value.toInt()) {
                              case 0:
                                text = 'CO2';
                                break;
                              case 1:
                                text = 'NO2';
                                break;
                              case 2:
                                text = 'PM2.5';
                                break;
                              default:
                                return Container();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(text, style: style),
                            );
                          },
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 20,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text('${value.toInt()}', style: style),
                            );
                          },
                          reservedSize: 40,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey),
                    ),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: Colors.red,
                          width: 15,
                        )
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                          toY: 60,
                          color: Colors.green,
                          width: 15,
                        )
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                          toY: 70,
                          color: Colors.orange,
                          width: 15,
                        )
                      ]),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AlertCard(
                    title: 'High Temperature Alert',
                    message: 'Temperature exceeded 30°C',
                  ),
                  AlertCard(
                    title: 'Low Humidity Alert',
                    message: 'Humidity dropped below 30%',
                  ),
                  AlertCard(
                    title: 'Poor Air Quality Alert',
                    message: 'Air quality index is high',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final String title;
  final String message;

  const AlertCard({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.red),
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}
