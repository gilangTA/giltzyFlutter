import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_akhir/InputHistoryPage.dart';
import 'package:tugas_akhir/ModelHistory.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

List<ModelHistory>? modelHistory;
int? sumWin = 0;
int? sumWinDisplay = 0;
int? sumLoseDisplay = 0;
int? sumLose = 0;
double? winrate;
int? length = modelHistory!.length;

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    ModelHistory.getApiHistory().then((value) {
      modelHistory = value;
      setState(() {});

      for (var i = 0; i < modelHistory!.length; i++) {
        if (modelHistory![i].result == "Win") {
          sumWin = sumWin! + 1;
        } else {
          sumLose = sumLose! + 1;
        }
      }

      winrate = sumWin! / modelHistory!.length * 100;

      sumWinDisplay = sumWin!;
      sumLoseDisplay = sumLose!;

      sumWin = 0;
      sumLose = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(23, 26, 33, 1),
          appBar: AppBar(
            title: Text("GilTzy"),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: 287,
                    height: 51,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Add History",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InputHistoryPage()));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Winrate : ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        (winrate != 0) ? winrate.toString() + " %" : "0.0 %",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: IconButton(
                          onPressed: (() {
                            Clipboard.setData(
                                ClipboardData(text: winrate.toString()));
                          }),
                          icon: Icon(Icons.copy),
                          color: Colors.white24,
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Win : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        (sumWinDisplay != 0) ? sumWinDisplay.toString() : "-",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Lose : ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      (sumLoseDisplay != 0) ? sumLoseDisplay.toString() : "-",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Hero',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Hero Damage',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Turret Damage',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Damage Taken',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'War Participation',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Result',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        if (modelHistory != null) ...[
                          for (var i = 0; i < modelHistory!.length; i++)
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i].heroName
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i].heroDamage.toString()
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i].turretDamage.toString()
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i].damageTaken.toString()
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i]
                                          .warParticipation
                                          .toString()
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                                DataCell(Text(
                                  (modelHistory != null)
                                      ? modelHistory![i].result
                                      : "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                              ],
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
