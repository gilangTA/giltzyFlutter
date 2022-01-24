import 'package:flutter/material.dart';
import 'package:tugas_akhir/ModelHistory.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    ModelHistory.getApiHistory().then((value) {
      modelHistory = value;
      setState(() {});
    });
    super.initState();
  }

  List<ModelHistory>? modelHistory;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("GilTzy"),
          ),
          body: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
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
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                        "0.0 %",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
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
