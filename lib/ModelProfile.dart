import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelProfile {
  String username;
  String email;

  ModelProfile({
    required this.username,
    required this.email,
  });

  factory ModelProfile.fromJson(Map<String, dynamic> responseData) {
    return ModelProfile(
      username: responseData['username'],
      email: responseData['email'],
    );
  }

  static Future<ModelProfile> getApiProfile() async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/user/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/user/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.get(apiURL, headers: {
      "Authorization": 'Bearer $token',
    });

    // print("Gilang");
    // print(apiResult.body);

    var jsonObject = json.decode(apiResult.body);

    return ModelProfile(
      username: jsonObject["username"],
      email: jsonObject["email"],
    );
  }
}
