import 'dart:convert';
import 'package:resep_makanan/model/resep.api.dart';
import 'package:http/http.dart' as http;
import 'package:resep_makanan/model/resep.dart';

class ResepApi {
// var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// 	"X-RapidAPI-Key": "e4f9ab7a35msh1906b3bc58eec97p17e5e3jsne3f00565f950",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "5e956a8c51msh2abdded928abfe8p10fd39jsnab4d91e42324",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }
    return Resep.resepFromSnapshot(_temp);
  }
}
