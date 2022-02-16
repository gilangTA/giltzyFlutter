import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/ModelStatistic.dart';
import 'package:tugas_akhir/InputStatistic.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<ModelStatistic>? modelStatistic;

  @override
  void initState() {
    ModelStatistic.getApiStatistic().then((value) {
      modelStatistic = value;
      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Statistic"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputStatistic()));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 50,
              minY: 0,
              maxY: 100,
              lineBarsData: [
                if (modelStatistic != null) ...[
                  LineChartBarData(
                    spots: [
                      for (var i = 0; i < modelStatistic!.length; i++)
                        FlSpot(i.toDouble(), modelStatistic![i].winrate),
                    ],
                    isCurved: true,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
