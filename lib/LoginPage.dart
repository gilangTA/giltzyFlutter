import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/ModelLogin.dart';
import 'package:tugas_akhir/ProgressHUDLogin.dart';
import 'package:tugas_akhir/RegisterPage.dart';
import 'package:tugas_akhir/Navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool validateAndSave() {
  final form = globalFormKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}

LoginRequestModel? loginRequestModel;
GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();
bool isLoading = false;
bool hidePassword = true;
bool isApiCallProcess = false;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(username: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      //valueColor: Colors.white,
    );
  }

  Widget uiSetup(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(23, 26, 33, 1),
          body: SingleChildScrollView(
            child: Form(
              key: globalFormKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(left: 50, top: 150),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.roboto(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 60, 44, 40),
                    child: TextFormField(
                      onSaved: (input) => loginRequestModel!.username = input!,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: GoogleFonts.roboto(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
                    child: TextFormField(
                      onSaved: (input) => loginRequestModel!.password = input!,
                      obscureText: hidePassword,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.roboto(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 60, 44, 0),
                    child: SizedBox(
                      width: 510,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });

                            APIService apiService = new APIService();
                            apiService
                                .login(loginRequestModel!)
                                .then((value) async {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              if (value.token.isNotEmpty) {
                                final preferences =
                                    await SharedPreferences.getInstance();
                                preferences.setString("token", value.token);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Navbar()));
                                const snackBar = SnackBar(
                                  content: Text("Login Success"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                const snackBar = SnackBar(
                                  content: Text("Login Fail"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                            // print(loginRequestModel!.toJson());
                          }
                          setState(() {
                            isLoading = true;
                          });
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 30),
                    // color: Color.fromRGBO(26, 42, 60, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
