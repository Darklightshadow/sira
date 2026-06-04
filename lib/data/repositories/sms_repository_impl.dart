import '../../domain/repositories/sms_repository.dart';
import '../datasources/remote/sms_remote_source.dart';

class SmsRepositoryImpl implements SmsRepository {
  final SmsRemoteSource _remoteSource;

  SmsRepositoryImpl({required SmsRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<void> envoyerRappel(String telephone, String message) async {
    await _remoteSource.envoyerSms(telephone, message);
  }

  @override
  Future<void> envoyerRecapVisite(
    String telephone,
    String codeAnonyme,
    String methodeNom,
  ) async {
    final message =
        'SIRA - Votre visite a été enregistrée. Code : $codeAnonyme. '
        'Méthode : $methodeNom. Conservez ce code pour vos prochaines visites.';
    await _remoteSource.envoyerSms(telephone, message);
  }
}
