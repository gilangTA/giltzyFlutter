import 'package:flutter/material.dart';
import 'package:tugas_akhir/HomePage.dart';
import 'package:tugas_akhir/LoginPage.dart';
import 'package:tugas_akhir/ProfilePage.dart';

void main() {
  runApp(Giltzy());
}

class Giltzy extends StatelessWidget {
  const Giltzy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
