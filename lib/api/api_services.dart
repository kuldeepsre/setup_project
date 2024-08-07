import 'dart:convert';

import 'package:setup_project/model/productr_res.dart';

import '../endpoint/constants.dart';
import '../model/post_response.dart';
import '../model/user_response.dart';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';

class ApiService {
  final String userApiUrl = 'https://jsonplaceholder.typicode.com/users';
  final String postApiUrl = 'https://jsonplaceholder.typicode.com/posts';
  final String productApiUrl = 'https://dummyjson.com/products';

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
  }  Future<List<Product>> fetchUserProduct({int page = 1, int perPage = 10}) async {
    final response = await http.get(Uri.parse(productApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      print(data);
      return data.map((json) => Product.fromJson(json)).toList();
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

  Future<Map<String, dynamic>> login(String username, String password) async {
    // Implement your API call logic here
    var res = await Utils.postApiCall(EndPoint.POST_LOGIN, {
      'username': username,
      "password": password,
      // "AppVersion": AppVersion
    });
     print(res);

    var jsonresult = json.decode(res.body);
    // LoginData  loginResponse=LoginData.fromJson(jsonresult);
    // if(loginResponse.result![0].msg=='Success')

    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return {'success': username == 'user' && password == 'password'};
  }
}
