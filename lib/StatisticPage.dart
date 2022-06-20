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
        backgroundColor: Color.fromRGBO(23, 26, 33, 1),
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
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height / 2,
              child: LineChart(
                LineChartData(
                  // minX: 0,
                  // maxX: 20,
                  // minY: 20,
                  // maxY: 100,

                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      checkToShowTitle: (_, __, ___, ____, x) => x % 1 == 0,
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          TextStyle(color: Colors.white),
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          TextStyle(color: Colors.white),
                    ),
                    rightTitles: SideTitles(showTitles: false),
                    topTitles: SideTitles(showTitles: false),
                  ),

                  lineBarsData: [
                    if (modelStatistic != null) ...[
                      LineChartBarData(
                        spots: [
                          for (var i = 0; i < modelStatistic!.length; i++)
                            FlSpot(i.toDouble(), modelStatistic![i].winrate),
                        ],
                        //isCurved: true,
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
        ),
      ),
    );
  }
}
