import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelResetPassword {
  String newpass;

  ModelResetPassword({
    required this.newpass,
  });

  factory ModelResetPassword.fromJson(Map<String, dynamic> responseData) {
    return ModelResetPassword(
      newpass: responseData['newPassword'],
    );
  }

  static Future putApiProfile(
    String pass,
  ) async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/user/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/user/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.put(apiURL, headers: {
      "Authorization": 'Bearer $token',
    }, body: {
      "password": pass,
    });

    var jsonObject = json.decode(apiResult.body);
    return ModelResetPassword(
      newpass: jsonObject["newpass"],
    );
  }
}
