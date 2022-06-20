import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tugas_akhir/LoginPage.dart';
import 'package:tugas_akhir/RegisterPage.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "XXX",
    appId: "XXX",
    messagingSenderId: "XXX",
    projectId: "XXX",
    databaseURL:
        "https://chat-1fa13-default-rtdb.firebaseio.com/", // Realtime Database
  ));

  //HttpOverrides.global = new MyHttpOverrides();
  runApp(Giltzy());
}

class Giltzy extends StatefulWidget {
  const Giltzy({Key? key}) : super(key: key);

  @override
  _GiltzyState createState() => _GiltzyState();
}

class _GiltzyState extends State<Giltzy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage()
      },
    );
  }
}
