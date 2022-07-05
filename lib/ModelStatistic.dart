import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelStatistic {
  String heroName;
  double winrate;

  ModelStatistic({
    required this.heroName,
    required this.winrate,
  });

  factory ModelStatistic.fromJson(Map<String, dynamic> object) {
    return ModelStatistic(
      heroName: object['hero_name'],
      winrate: object['winrate'],
    );
  }

  static Future<List<ModelStatistic>> getApiStatistic() async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/statistic/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/statistic/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.get(apiURL, headers: {
      "Authorization": 'Bearer $token',
    });

    // print("Gilang");
    // print(apiResult.body);

    final parsed = jsonDecode(apiResult.body).cast<Map<String, dynamic>>();

    return parsed
        .map<ModelStatistic>((json) => ModelStatistic.fromJson(json))
        .toList();
  }

  static Future<ModelStatistic> postApiStatistic(
    String heroName,
    String winrate,
  ) async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/statistic/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/statistic/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.post(apiURL, headers: {
      "Authorization": 'Bearer $token'
    }, body: {
      "hero_name": heroName,
      "winrate": winrate,
    });

    var jsonObject = json.decode(apiResult.body);
    return ModelStatistic(
      heroName: jsonObject["hero_name"],
      winrate: jsonObject["winrate"],
    );
  }

  static Future delApiStatistic() async {
    //Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/statistic/");
    Uri apiURL = Uri.parse("http://192.168.43.136:8000/api/statistic/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.delete(apiURL, headers: {
      "Authorization": 'Bearer $token',
    });
    if (apiResult.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
