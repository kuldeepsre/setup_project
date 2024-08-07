import 'package:setup_project/model/productr_res.dart';

import '../api/api_services.dart';
import '../model/post_response.dart';
import '../model/user_response.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<List<User>> getUser({int page = 1, int perPage = 10});
  Future<List<Product>> getProduct({int page = 1, int perPage = 10});
}

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<List<User>> getUsers() async {
    return await apiService.fetchUsers();
  }

  @override
  Future<List<User>> getUser({int page = 1, int perPage = 10}) async {
    return await apiService.fetchUserData();
  }

  @override
  Future<List<Product>> getProduct({int page = 1, int perPage = 10}) async {

    return await apiService.fetchUserProduct();
  }


}

class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<Post>> getPosts() async {
    return await apiService.fetchPosts();
  }
}
