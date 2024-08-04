import '../../api/api_services.dart';
import '../../model/post_response.dart';

abstract class LoginRepository {
  Future<bool> login(String username, String password);

}

class LoginPostRepositoryImpl implements LoginRepository {
  final ApiService apiService;
  LoginPostRepositoryImpl(this.apiService);

  Future<bool> login(String username, String password) async {
    final response = await apiService.login(username, password);
    return response['success'] == true;
  }
  }