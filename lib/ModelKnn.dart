import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelKnn {
  String performance;
  String analysis;

  ModelKnn({
    required this.performance,
    required this.analysis,
  });

  static Future<ModelKnn> connectAPI(
      String a, String b, String c, String d, String e) async {
    Uri apiURL = Uri.parse("http://192.168.1.2:8000/api/knnResult/");

    var apiResult = await http.post(apiURL, body: {
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
