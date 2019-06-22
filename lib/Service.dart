import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mobile.dart';
 
class Services {
  static Future<List<Mobile>> getPhotos(String type,String model) async {
    try {
      final response =
          await http.get("https://mobileisp-27ca2.firebaseio.com/" + type +"/" + model + ".json");
      if (response.statusCode == 200) {
        List<Mobile> list = parsePhotos(response.body);
        return list.reversed.toList();
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
 
  // Parse the JSON response and return list of Album Objects //
  static List<Mobile> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Mobile>((json) => Mobile.fromJson(json)).toList();
  }
}