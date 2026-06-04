import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/csps_model.dart';

class CspsRemoteSource {
  final ApiClient _apiClient;

  CspsRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<CspsModel>> getCsps() async {
    final response = await _apiClient.get(ApiEndpoints.csps);
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => CspsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<CspsModel> getCspsById(String id) async {
    final response = await _apiClient.get(ApiEndpoints.cspsById(id));
    return CspsModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<CspsModel>> getCspsParDistrict(String districtId) async {
    final response = await _apiClient.get(
      ApiEndpoints.cspsParDistrict(districtId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => CspsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<CspsModel>> getCspsAvecMethode(String methodeId) async {
    final response = await _apiClient.get(
      ApiEndpoints.cspsAvecMethode(methodeId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => CspsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
