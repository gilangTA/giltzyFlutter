import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelRegister {
  String message;

  ModelRegister({
    required this.message,
  });

  static Future<ModelRegister> postApiHistory(
    String username,
    String password,
    String email,
  ) async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/registerUser/");

    var apiResult = await http.post(apiURL, body: {
      "username": username,
      "password": password,
      "email": email,
    });

    // print("Gilang");
    // print(apiResult.body);

    var jsonObject = json.decode(apiResult.body);
    return ModelRegister(
      message: jsonObject["message"],
    );
  }
}
