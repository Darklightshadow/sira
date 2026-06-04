import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/visite_model.dart';

class VisiteRemoteSource {
  final ApiClient _apiClient;

  VisiteRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<VisiteModel> enregistrerVisite(Map<String, dynamic> json) async {
    final response = await _apiClient.post(
      ApiEndpoints.visites,
      body: json,
    );
    return VisiteModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<VisiteModel>> getVisitesParAgent(String agentId) async {
    final response = await _apiClient.get(
      ApiEndpoints.visitesParAgent(agentId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => VisiteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<VisiteModel>> getVisitesParCode(String codeAnonyme) async {
    final response = await _apiClient.get(
      ApiEndpoints.visitesParCode(codeAnonyme),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => VisiteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
