import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';

class SmsRemoteSource {
  final ApiClient _apiClient;

  SmsRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<void> envoyerSms(String telephone, String message) async {
    await _apiClient.post(
      ApiEndpoints.sms,
      body: {'telephone': telephone, 'message': message},
    );
  }
}
