import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/stock_model.dart';

class StockRemoteSource {
  final ApiClient _apiClient;

  StockRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<StockModel>> getStocksParCsps(String cspsId) async {
    final response = await _apiClient.get(
      ApiEndpoints.stocksParCsps(cspsId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => StockModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> decrementerStock(
    String cspsId,
    String methodeId,
    int quantite,
  ) async {
    await _apiClient.post(
      ApiEndpoints.decrementerStock(cspsId, methodeId),
      body: {'quantite': quantite},
    );
  }

  Future<void> mettreAJourStock(Map<String, dynamic> json) async {
    await _apiClient.put(
      ApiEndpoints.mettreAJourStock(json['csps_id'] as String),
      body: json,
    );
  }
}
