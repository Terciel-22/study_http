import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:study_http/model/post.model.dart';
import 'package:http/http.dart' as http;

class PostService extends ChangeNotifier {
  static const String baseUrl = "https://dummyjson.com";
  List<dynamic> _posts = [];
  List<dynamic> get posts => _posts;

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      _posts =
          jsonResponse["posts"].map((data) => Post.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception("Unable to fetch posts.");
    }
  }
}
