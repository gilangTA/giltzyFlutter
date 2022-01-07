import 'dart:convert';
import 'package:http/http.dart' as http;

class PostPerformance {
  String performance;

  PostPerformance({required this.performance});

  static Future<PostPerformance> connectAPI(
      String a, String b, String c, String d, String e) async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/knnResult/");

    var apiResult = await http.post(apiURL, body: {
      "hero_damage": a,
      "damage_taken": b,
      "war_participation": c,
      "turret_damage": d,
      "role_id": e,
    });

    var jsonObject = json.decode(apiResult.body);
    return PostPerformance(
      performance: jsonObject["performance"],
    );
  }
}
