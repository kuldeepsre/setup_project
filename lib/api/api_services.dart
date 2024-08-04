import 'dart:convert';

import '../model/post_response.dart';
import '../model/user_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String userApiUrl = 'https://jsonplaceholder.typicode.com/users';
  final String postApiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(userApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse(userApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<User>> fetchUserData({int page = 1, int perPage = 10}) async {
    final response = await http.get(Uri.parse(userApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(postApiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
  Future<List<Post>> FormPosts() async {
    final response = await http.post(Uri.parse(postApiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
