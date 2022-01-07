import 'dart:convert';
import 'package:http/http.dart' as http;

class PostAnalysis {
  String analysis;

  PostAnalysis({required this.analysis});

  static Future<PostAnalysis> connectAPI(
      String a, String b, String c, String d, String e) async {
    Uri apiURL = Uri.parse("http://127.0.0.1:8000/api/knnResultAnalysis/");

    var apiResult = await http.post(apiURL, body: {
      "hero_damage": a,
      "damage_taken": b,
      "war_participation": c,
      "turret_damage": d,
      "role_id": e,
    });

    var jsonObject = json.decode(apiResult.body);
    return PostAnalysis(analysis: jsonObject["analysis"]);
  }
}

// import 'package:tugas_akhir/Result.dart';

// class Repo {
//   final uri = "http://127.0.0.1:8000/api/knnResult/";

//   Future postData(String a, String b, String c, String d, String e) async {
//     try {
//       final response = await http.post(Uri.parse(uri), body: {
//         "hero_damage": a,
//         "damage_taken": b,
//         "war_participation": c,
//         "turret_damage": d,
//         "role_id": e,
//       });

//       if (response.statusCode == 201) {
//         return Result.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception("failed");
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }