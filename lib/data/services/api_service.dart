import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';
  static const int _limit = 10;

  static Future<Map<String, dynamic>> fetchPosts({int skip = 0}) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/posts?limit=$_limit&skip=$skip'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final posts = (data['posts'] as List)
            .map((json) => PostModel.fromJson(json))
            .toList();

        return {
          'posts': posts,
          'total': data['total'],
          'hasMore': (skip + _limit) < data['total'],
        };
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}