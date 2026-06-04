import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/methode_model.dart';

class MethodeRemoteSource {
  final ApiClient _apiClient;

  MethodeRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<MethodeModel>> getMethodes() async {
    final response = await _apiClient.get(ApiEndpoints.methodes);
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => MethodeModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<MethodeModel> getMethodeById(String id) async {
    final response = await _apiClient.get(ApiEndpoints.methodeById(id));
    return MethodeModel.fromJson(response.data as Map<String, dynamic>);
  }
}
