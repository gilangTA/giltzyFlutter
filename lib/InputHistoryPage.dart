import 'package:flutter/material.dart';

import 'package:tugas_akhir/ModelHistory.dart';
import 'package:tugas_akhir/ModelStatistic.dart';
import 'package:tugas_akhir/Navbar.dart';

enum SingingCharacter { win, lose }

class InputHistoryPage extends StatefulWidget {
  const InputHistoryPage({Key? key}) : super(key: key);

  @override
  _InputHistoryPageState createState() => _InputHistoryPageState();
}

class _InputHistoryPageState extends State<InputHistoryPage> {
  ModelHistory? modelHistory;
  ModelStatistic? modelStatistic;
  double winrateInput = 0;
  int? sumWinInput = 0;
  //SingingCharacter? _character = SingingCharacter.win;
  String dropdownValue = 'Select Result';

  final heroNameController = TextEditingController();
  final heroDamageController = TextEditingController();
  final turretDamageController = TextEditingController();
  final warParticipationController = TextEditingController();
  final damageTakenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(23, 26, 33, 1),
          appBar: AppBar(
            title: Text("Input History"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 36, 38, 32),
                  child: Text(
                    "Battle History",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Hero's Name",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 200,
                  height: 100,
                  child: TextField(
                    controller: heroNameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 58.5),
                      child: Column(
                        children: [
                          Text(
                            "Hero Damage",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 100,
                            height: 100,
                            child: TextField(
                              controller: heroDamageController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Damage Taken",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 100,
                            height: 100,
                            child: TextField(
                              controller: damageTakenController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 58.5),
                      child: Column(
                        children: [
                          Text(
                            "Turret Damage",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 100,
                            height: 100,
                            child: TextField(
                              controller: turretDamageController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "War Participation",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 100,
                            height: 100,
                            child: TextField(
                              controller: warParticipationController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Result Battle",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: dropdownValue,
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Select Result',
                    'Win',
                    'Lose',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),

                // ListTile(
                //   title: Text(
                //     "Win",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   leading: Radio<SingingCharacter>(
                //     fillColor: MaterialStateColor.resolveWith(
                //         (states) => Colors.white),
                //     value: SingingCharacter.win,
                //     groupValue: _character,
                //     onChanged: (SingingCharacter? value) {
                //       setState(() {
                //         _character = value;
                //       });
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: Text(
                //     "Lose",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   leading: Radio<SingingCharacter>(
                //     fillColor: MaterialStateColor.resolveWith(
                //         (states) => Colors.white),
                //     value: SingingCharacter.lose,
                //     groupValue: _character,
                //     onChanged: (SingingCharacter? value) {
                //       setState(() {
                //         _character = value;
                //       });
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 287,
                    height: 51,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        ModelHistory.postApiHistory(
                          heroNameController.text,
                          heroDamageController.text,
                          damageTakenController.text,
                          warParticipationController.text,
                          turretDamageController.text,
                          dropdownValue,
                        ).then((value) {
                          modelHistory = value;
                        });

                        // if (dropdownValue == "Win") {
                        //   sumWinInput = sumWinInput! + 1;
                        //   winrateInput = sumWinInput! / (length! + 1) * 100;
                        // }

                        // ModelStatistic.postApiStatistic(
                        //   heroNameController.text,
                        //   winrateInput.toString(),
                        // ).then((value) {
                        //   modelStatistic = value;
                        // });

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Navbar()));
                      },
                      child: Text(
                        "Add Battle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
