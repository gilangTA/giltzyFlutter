import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({
    required this.token,
    required this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] != null ? json['token'] : '',
      error: json['error'] != null ? json['error'] : '',
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
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/token/");

    final response = await http.post(apiURL, body: requestModel.toJson());
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login Failed');
    }
  }
}
