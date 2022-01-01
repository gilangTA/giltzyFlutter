import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    width: 500,
                    color: Colors.white,
                    child: Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 30,
                    color: Colors.white,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 200),
                child: SizedBox(
                  width: 510,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Statistic",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 510,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 510,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "About",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 510,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Reset Statistic",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 510,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
