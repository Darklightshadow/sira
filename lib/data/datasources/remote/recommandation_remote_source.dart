import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/recommandation_model.dart';

class RecommandationRemoteSource {
  final ApiClient _apiClient;

  RecommandationRemoteSource({required ApiClient apiClient})
      : _apiClient = apiClient;

  Future<RecommandationModel> getRecommandation(
    Map<String, dynamic> profilJson,
  ) async {
    final response = await _apiClient.post(
      ApiEndpoints.recommandation,
      body: profilJson,
    );
    return RecommandationModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
