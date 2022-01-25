import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelHistory {
  //int idHistory;
  String heroName;
  int heroDamage;
  int turretDamage;
  int damageTaken;
  int warParticipation;
  String result;
  //int idUser;

  ModelHistory({
    //required this.idHistory,
    required this.heroName,
    required this.heroDamage,
    required this.turretDamage,
    required this.damageTaken,
    required this.warParticipation,
    required this.result,
    //required this.idUser
  });

  factory ModelHistory.fromJson(Map<String, dynamic> object) {
    return ModelHistory(
      //idHistory: object['id_history'],
      heroName: object['hero_name'],
      heroDamage: object['hero_damage'],
      turretDamage: object['turret_damage'],
      damageTaken: object['damage_taken'],
      warParticipation: object['war_participation'],
      result: object['result'],
      //idUser: object['id_user'],
    );
  }

  static Future<List<ModelHistory>> getApiHistory() async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/history/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.get(apiURL, headers: {
      "Authorization": 'Bearer $token',
    });

    // print("Gilang");
    // print(apiResult.body);

    final parsed = jsonDecode(apiResult.body).cast<Map<String, dynamic>>();

    return parsed
        .map<ModelHistory>((json) => ModelHistory.fromJson(json))
        .toList();
  }

  static Future<ModelHistory> postApiHistory(
    String a,
    String b,
    String c,
    String d,
    String e,
    String f,
  ) async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/history/");

    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;

    var apiResult = await http.post(apiURL, headers: {
      "Authorization": 'Bearer $token'
    }, body: {
      "hero_name": a,
      "hero_damage": b,
      "damage_taken": c,
      "war_participation": d,
      "turret_damage": e,
      "result": f,
    });

    print("Gilang");
    print(apiResult.body);

    var jsonObject = json.decode(apiResult.body);
    return ModelHistory(
      heroName: jsonObject["hero_name"],
      heroDamage: jsonObject["hero_damage"],
      turretDamage: jsonObject["turret_damage"],
      damageTaken: jsonObject["damage_taken"],
      warParticipation: jsonObject["war_participation"],
      result: jsonObject["result"],
    );
  }
}
