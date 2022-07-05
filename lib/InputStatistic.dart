import 'package:flutter/material.dart';
import 'package:tugas_akhir/ModelStatistic.dart';
//import 'package:tugas_akhir/StatisticPage.dart';

class InputStatistic extends StatefulWidget {
  const InputStatistic({Key? key}) : super(key: key);

  @override
  _InputStatisticState createState() => _InputStatisticState();
}

class _InputStatisticState extends State<InputStatistic> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ModelStatistic? modelStatistic;
    final heroNameController = TextEditingController();
    final winrateController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(23, 26, 33, 1),
        appBar: AppBar(
          title: Text("Input Statistic"),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 50),
                  child: Text(
                    "Hero's Name",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
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
                Text(
                  "Winrate",
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
                    controller: winrateController,
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
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ),
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
                        ModelStatistic.postApiStatistic(
                          heroNameController.text,
                          winrateController.text,
                        ).then((value) {
                          modelStatistic = value;
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => StatisticPage()));
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
