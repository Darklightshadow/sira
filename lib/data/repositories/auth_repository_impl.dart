import '../../domain/entities/agent_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_source.dart';
import '../../core/storage/preferences_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  final PreferencesService _preferencesService;

  AuthRepositoryImpl({
    required AuthRemoteSource remoteSource,
    required PreferencesService preferencesService,
  })  : _remoteSource = remoteSource,
        _preferencesService = preferencesService;

  @override
  Future<AgentEntity> login(String identifiant, String pin) async {
    final result = await _remoteSource.login(identifiant, pin);
    await _preferencesService.sauvegarderToken(result['token'] as String);
    final agentModel = result['agent'];
    return agentModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await _preferencesService.supprimerToken();
  }

  @override
  Future<AgentEntity?> getAgentConnecte() async {
    final token = await _preferencesService.getToken();
    if (token == null) return null;
    try {
      final model = await _remoteSource.getAgentConnecte(token);
      return model.toEntity();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> estConnecte() async {
    final token = await _preferencesService.getToken();
    return token != null;
  }
}
