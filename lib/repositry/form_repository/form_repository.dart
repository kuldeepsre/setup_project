import '../../api/api_services.dart';
import '../../model/post_response.dart';

abstract class FormRepository {
  Future<List<Post>> FormPosts();

}
class FormPostRepositoryImpl implements FormRepository {
  final ApiService apiService;

  FormPostRepositoryImpl(this.apiService);

  @override
  Future<List<Post>> FormPosts() async {
    return await apiService.FormPosts();
  }
}