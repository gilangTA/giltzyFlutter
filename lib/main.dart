import 'dart:io';
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

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(Giltzy());
}

class Giltzy extends StatelessWidget {
  const Giltzy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage()
      },
    );
  }
}
