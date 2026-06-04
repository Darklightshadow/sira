import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/agent_model.dart';

class AuthRemoteSource {
  final ApiClient _apiClient;

  AuthRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Map<String, dynamic>> login(String identifiant, String pin) async {
    final response = await _apiClient.post(
      ApiEndpoints.login,
      body: {'identifiant': identifiant, 'pin': pin},
    );
    final data = response.data as Map<String, dynamic>;
    return {
      'token': data['token'],
      'agent': AgentModel.fromJson(data['agent'] as Map<String, dynamic>),
    };
  }

  Future<AgentModel> getAgentConnecte(String token) async {
    final response = await _apiClient.get(ApiEndpoints.agentMe);
    return AgentModel.fromJson(response.data as Map<String, dynamic>);
  }
}
