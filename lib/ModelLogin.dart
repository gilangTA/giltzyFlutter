import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginResponseModel {
  final String token;

  LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['access'] != null ? json['access'] : '',
    );
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/token/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/token/");

    final response = await http.post(apiURL, body: requestModel.toJson());
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login Failed');
    }
  }
}
