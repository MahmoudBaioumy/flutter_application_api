import 'dart:convert';
import 'package:flutter_application_api/core/constants.dart';
import 'package:flutter_application_api/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<PostModel>?> getposts() async {
    try {
      var url = Uri.parse(AppConstants.basUrl + AppConstants.photosendpoints);
      var res = await http.get(url);

      if (res.statusCode == 200) {
        List data = jsonDecode(res.body) as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
