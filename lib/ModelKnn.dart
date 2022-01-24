import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelKnn {
  String performance;
  String analysis;

  ModelKnn({
    required this.performance,
    required this.analysis,
  });

  static Future<ModelKnn> postApiKnn(
    String a,
    String b,
    String c,
    String d,
    String e,
  ) async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/knnResult/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    //print("Gilang");
    // print(body);
    var apiResult = await http.post(apiURL, headers: {
      "Authorization": 'Bearer $token',
    }, body: {
      "hero_damage": a,
      "damage_taken": b,
      "war_participation": c,
      "turret_damage": d,
      "role_id": e,
    });

    var jsonObject = json.decode(apiResult.body);
    return ModelKnn(
      performance: jsonObject["performance"],
      analysis: jsonObject["analysis"],
    );
  }
}
