import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:udemy_course/model/photo_model.dart';

List<PhotoModel> parsePhotos(String responseBody) {
  var l = jsonDecode(responseBody) as List<dynamic>;
  List<PhotoModel> photos =
      l.map((model) => PhotoModel.fromJson(model)).toList();
  return photos;
}

Future<List<PhotoModel>> fetchPhotos() async {
  var url = Uri.https("jsonplaceholder.typicode.com", "photos");
  final response = await http.get(url).timeout(Duration(seconds: 10));
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  }
  return throw Exception('can not found Photos');
}
