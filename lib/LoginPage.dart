import 'package:flutter/material.dart';
import 'package:tugas_akhir/HomePage.dart';
import 'package:tugas_akhir/ModelLoginRegister.dart';
import 'package:tugas_akhir/ProgressHUD.dart';
import 'package:tugas_akhir/RegisterPage.dart';

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
          backgroundColor: Colors.black,
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
                      style: TextStyle(
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
                        labelStyle: TextStyle(color: Colors.white),
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
                        labelStyle: TextStyle(color: Colors.white),
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
                            apiService.login(loginRequestModel!).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              if (value.token.isNotEmpty) {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            });
                            print(loginRequestModel!.toJson());
                          }
                          setState(() {
                            isLoading = true;
                          });
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 50,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 12),
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
                            style: TextStyle(
                              color: Colors.black,
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
