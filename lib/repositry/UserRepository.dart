import '../api/api_services.dart';
import '../model/post_response.dart';
import '../model/user_response.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
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
}

class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<Post>> getPosts() async {
    return await apiService.fetchPosts();
  }
}